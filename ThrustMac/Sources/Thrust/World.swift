import Foundation

/// Random generator of the original ($AAB8), state $3B:$3A.
struct Rng {
    var s = 0x5A17
    @discardableResult mutating func next() -> Int {
        let oldLo = s & 0xFF
        let t = ((s << 2) | 1) & 0xFFFF
        s = (s + t) & 0xFFFF
        let hi = ((s >> 8) + oldLo) & 0xFF
        s = (hi << 8) | (s & 0xFF)
        return hi ^ (s & 0xFF)
    }
    var hi: Int { s >> 8 }
    var lo: Int { s & 0xFF }
}

/// Bullets, gun shots, explosion debris, smoke and stars share one 32-slot pool ($0600-$07BF).
struct Particle {
    enum Owner: Int { case player = 0, smoke = 1, debris = 2, gun = 3 }
    var x = 0, y = 0            // 8.8 fixed point (x in 4-px units, y in rows)
    var vx = 0, vy = 0          // 8.8 per iteration
    var life = 0
    var owner = Owner.player
    var px = 0, py = 0          // previous position (for smooth rendering)
    var active: Bool { life > 0 }
}

struct GameObject {
    enum Kind: Int { case gun0 = 0, gun1, gun2, gun3, fuel, pod, reactor, switchL, switchR }
    let kind: Kind
    let index: Int
    let x: Int, y: Int, flags: Int
    var alive = true
    var fuelCounter = 0

    var isGun: Bool { kind.rawValue <= 3 }
    static let hitW = [5, 5, 5, 5, 4, 5, 5, 2, 2]
    static let hitH = [8, 8, 8, 8, 10, 8, 10, 8, 8]
}

/// Events the world reports to the game flow.
enum WorldEvent {
    case lifeLost           // explosion finished
    case leftPlanet         // flew off the top
}

/// One planet being played: a port of the original main loop ($B1AD-$B274).
final class World {
    let level: Level
    let sound: Sound
    var rng: Rng
    let reverseGravity: Bool
    let invisible: Bool
    let fireThreshold: Int        // $A3

    // ship
    var body = ShipBody()
    var it = 0                    // $19
    var alive = true
    var deathTimer = 0            // $44 countdown
    var shipExploded = false
    var podExploded = false
    var wreckStopped = false      // $42 == 0
    private var pendingExplosion = false
    var shieldHeld = false        // $27
    var shieldShown = false       // $28
    var refuelling = false
    var tractorLock = false       // $68
    var podTaken = false          // $B520
    var podCollectedFlag = false  // $A6A6: restart with pod
    var graceTicks = 0            // $AF90
    private var fireLatch = false // $2C
    private var bulletRing = 0    // $2D
    private var prevShipDraw = (x: 0, y: 0)
    private var shipDelta = (x: 0, y: 0)

    // camera
    var camX = 0, camRow = 0
    private var speedX = 0, speedY = 0   // $05, $06 (signed)
    var wrapped = false

    // objects, particles
    var objects: [GameObject] = []
    var particles = [Particle](repeating: Particle(), count: 32)

    // reactor
    var reactorDamage = 0         // $3E
    var rechargeTimer = 0         // $3D
    var countdown = -1            // $6A
    private var countdownSub = 0  // $69
    var planetDestroyed = false
    var flash = 0                 // $02 background flash

    // shared game counters (owned by Game, mutated here)
    unowned let stats: GameStats
    var irqFrame = 0              // $1A (50 Hz counter, advanced by the game)

    var pendingEvents: [WorldEvent] = []
    var exitState = false

    init(levelIndex: Int, stats: GameStats, sound: Sound, reverseGravity: Bool, invisible: Bool,
         fireThreshold: Int, rng: Rng) {
        level = Level(index: levelIndex)
        self.stats = stats
        self.sound = sound
        self.reverseGravity = reverseGravity
        self.invisible = invisible
        self.fireThreshold = fireThreshold
        self.rng = rng
        for (i, o) in level.def.objects.enumerated() {
            objects.append(GameObject(kind: GameObject.Kind(rawValue: o.type) ?? .fuel, index: i, x: o.x, y: o.y, flags: o.flags))
        }
        spawn(deathY: 0)
    }

    var gravity: Int { reverseGravity ? -(level.def.gravity + 1) : level.def.gravity }

    // MARK: - (re)spawn ($A5B9)

    /// Places the ship at the restart point chosen from the height where it died.
    func spawn(deathY: Int) {
        let pts = level.def.restart
        let n = pts.count
        var i = pts.firstIndex { $0.ship_y >= deathY } ?? n
        if i == n { podCollectedFlag = false }
        if i > 0 && !podCollectedFlag { i -= 1 }
        if i == n - 1 { podCollectedFlag = false }
        let p = pts[i]

        body = ShipBody()
        body.gravity = gravity
        body.x = p.ship_x << 16
        body.y = p.ship_y << 8
        body.angle = reverseGravity ? 16 : 0
        camX = p.camera_x
        camRow = p.camera_row
        speedX = 0; speedY = 0
        it = 0
        alive = true
        deathTimer = 0
        shipExploded = false; podExploded = false; wreckStopped = false; pendingExplosion = false
        shieldHeld = false; shieldShown = false; tractorLock = false; refuelling = false
        fireLatch = false; bulletRing = 0
        reactorDamage = 0
        rechargeTimer = 15
        countdown = -1
        countdownSub = 0
        level.doorTimer = 0; level.doorOpen = 0
        for i in particles.indices { particles[i].life = 0 }
        podTaken = false
        if podCollectedFlag {
            podTaken = true
            body.podAttached = true
            body.rod = (reverseGravity ? 0x11 : 0x01) << 16
        }
        let d = body.shipPosition()
        prevShipDraw = d
        shipDelta = (0, 0)
        graceTicks = 0
    }

    // MARK: - helpers

    var shipDraw: (x: Int, y: Int) { body.shipPosition() }
    var podDraw: (x: Int, y: Int) { body.podPosition() }
    var pod: GameObject? { objects.first { $0.kind == .pod } }

    func explode(x: Int, y: Int, count: Int = 8, owner: Particle.Owner = .debris, startDir: Int? = nil) {
        sound.play(.explosion)
        var dir = startDir ?? (count == 3 ? rng.next() & 31 : rng.next() & 31)
        for _ in 0..<count {
            let slot = allocParticle()
            rng.next()
            let d = (dir + (rng.next() & 3)) & 31
            let k = rng.hi & 3
            let vx = (Tables.tx[d] >> 4) * (k + 2)
            let vy = (Tables.ty[d] >> 4) * (k + 2)
            var p = Particle()
            p.x = x; p.y = y; p.vx = vx; p.vy = vy
            p.life = ((k << 3) ^ 31) + ((rng.lo & 15) >> 1) + 8
            p.owner = owner
            p.x += 2 * vx; p.y += 2 * vy
            p.px = p.x; p.py = p.y
            particles[slot] = p
            dir = (dir + 4) & 31
        }
    }

    /// $9FDD: first free slot from 31 down to 1, else one that is about to expire, else slot 0.
    func allocParticle() -> Int {
        for s in stride(from: 31, through: 1, by: -1) where !particles[s].active { return s }
        for s in stride(from: 31, through: 1, by: -1) where particles[s].life < 10 { return s }
        return 0
    }

    func addScore(_ points: Int) { stats.addScore(points) }

    // MARK: - main loop iteration

    func step(_ b: Buttons) {
        wrapped = false
        // keep previous positions for interpolation
        for i in particles.indices { particles[i].px = particles[i].x; particles[i].py = particles[i].y }

        // $9E09 rotation (also polled while dead, as in the original)
        var dir = 0
        if b.contains(.left) { dir -= 1 }
        if b.contains(.right) { dir += 1 }
        body.rotate(it: it, dir: dir)

        // $9E28 integrate
        body.integrate(alive: alive)

        // $9014 camera + doors
        updateCamera()

        // $B2C8 death state machine
        updateDeath()

        // $8571 objects: guns, reactor, pickups, bullet hits
        updateObjects()

        // $9799 shield / tractor, $9926 pod pickup
        updateShieldAndPickup(b)

        // $A99A fire
        updateFire(b)

        // $A38E particles (+ stars)
        updateParticles()

        // $9E77 ship draw position delta
        let d = shipDraw
        shipDelta = (d.x - prevShipDraw.x, d.y - prevShipDraw.y)
        prevShipDraw = d

        // $9588 velocity
        let thrust = b.contains(.thrust)
        if body.updateVelocity(it: it, alive: alive, wreckStopped: wreckStopped, thrust: thrust, hasFuel: !stats.fuelEmpty) {
            burnFuel()
            sound.play(.thrust)
        }
        it = (it + 1) & 0xFF

        // collisions (the original checks the VIC collision registers every video frame)
        checkCollisions()

        // $B3D5 left the planet?
        if alive {
            let cy = body.y >> 8
            if cy >= 0x100 && cy < 0x120 {
                pendingEvents.append(.leftPlanet)
            }
        }
    }

    private func burnFuel() {
        stats.burnFuel()
    }

    // MARK: camera ($9014)

    private func updateCamera() {
        camX = (camX + speedX) & 0xFF
        if speedY != 0 { camRow += speedY }
        level.updateDoor(cameraRow: camRow)

        // vertical
        let yLo = (body.y >> 8) & 0xFF
        let e = (yLo - (camRow & 0xFF) - 0x38) & 0xFF
        let vyHi = (body.vy >> 8)            // signed
        var s6 = speedY
        if vyHi >= 0 {
            if e >= 0x46 {
                s6 = vyHi + 1
            } else if s6 > 0 {
                if vyHi + 1 < s6 { s6 -= 1; if s6 == 0 { s6 = 1 } }
            }
        } else {
            if e < 0x20 {
                s6 = vyHi - 1
            } else if s6 < 0 {
                if s6 < vyHi { s6 += 1; if s6 == 0 { s6 = -1 } }
            }
        }
        if s6 > 0 && e < 0x2D { s6 = 0 }
        if s6 < 0 && e >= 0x39 { s6 = 0 }
        speedY = s6

        // horizontal
        let d = ((body.x >> 16) - camX) & 0xFF
        var s5 = speedX
        if d < 0x14 { s5 = d - 0x14 } else if d > 0x32 { s5 = d - 0x32 }
        if s5 > 0 {
            if d < 0x1D { s5 = 0 } else if d < 0x32 { s5 -= 1; if s5 == 0 { s5 = 1 } }
        } else if s5 < 0 {
            if d >= 0x29 { s5 = 0 } else if d >= 0x14 { s5 += 1; if s5 == 0 { s5 = -1 } }
        }
        speedX = s5

        // horizontal wrap ($9111)
        var shift = 0
        if camX == 0 || camX >= 0xD8 { shift = 175 } else if camX >= 0xB0 { shift = -175 }
        if shift != 0 {
            camX = (camX + shift) & 0xFF
            body.x = (body.x + (shift << 16)) & 0xFFFFFF
            prevShipDraw.x += shift << 8
            for i in particles.indices {
                particles[i].x += shift << 8
                particles[i].px = particles[i].x; particles[i].py = particles[i].y
            }
            wrapped = true
        }
    }

    // MARK: death ($B2C8)

    func crashShip() {
        guard alive else { return }
        alive = false
        deathTimer = 60
        let s = shipDraw
        shipExploded = true
        explode(x: (s.x) + 4 * 256, y: s.y + 5 * 256)
        if body.podAttached { pendingExplosion = true }
    }

    func crashPod() {
        guard alive, body.podAttached else { return }
        alive = false
        deathTimer = 60
        let p = podDraw
        podExploded = true
        explode(x: p.x + 4 * 256, y: p.y + 5 * 256)
        body.podAttached = false
        pendingExplosion = true
    }

    private func updateDeath() {
        guard !alive else { return }
        if shipExploded && !body.podAttached { wreckStopped = true }
        if body.rodLength >= 0 { body.rodLength -= 2 }
        if pendingExplosion && body.rodLength < 0 {
            pendingExplosion = false
            deathTimer = 60
            if !shipExploded {
                shipExploded = true
                let s = shipDraw
                explode(x: s.x + 4 * 256, y: s.y + 5 * 256)
            } else if body.podAttached {
                podExploded = true
                let p = podDraw
                explode(x: p.x + 4 * 256, y: p.y + 5 * 256)
                body.podAttached = false
            }
        }
        deathTimer -= 1
        if deathTimer <= 0 && !pendingExplosion {
            pendingEvents.append(.lifeLost)
        }
    }

    // MARK: objects ($8571)

    func objectVisible(_ o: GameObject) -> Bool {
        let r = o.y - camRow - 56
        return r >= 9 && r < 97
    }

    private func updateObjects() {
        // reactor recharge and countdown
        if it & 1 == 0 && rechargeTimer > 0 { rechargeTimer -= 1 }
        countdownSub -= 1
        if countdownSub < 0 {
            countdownSub = 32
            if countdown > 0 {
                countdown -= 1
                sound.play(.ping)
                if countdown == 0 { destroyPlanet() }
            }
        }

        for i in objects.indices where objects[i].alive {
            let o = objects[i]
            switch o.kind {
            case .gun0, .gun1, .gun2, .gun3:
                if (o.y >> 8) == (camRow >> 8) && rechargeTimer == 0 && countdown < 0 && !planetDestroyed
                    && rng.next() < fireThreshold {
                    fireGun(o)
                }
            case .reactor:
                if it & 7 == 0 && rechargeTimer == 0 && countdown < 0 && objectVisible(o) {
                    let s = allocParticle()
                    var p = Particle()
                    p.x = (o.x + 4) << 8; p.y = o.y << 8; p.vy = -114; p.life = 10; p.owner = .smoke
                    p.px = p.x; p.py = p.y
                    particles[s] = p
                }
            default: break
            }
        }

        // fuel pickup ($86EB)
        refuelling = false
        if alive && !body.podAttached && shieldHeld {
            let s = shipDraw
            let sx = s.x >> 8, sy = s.y >> 8
            for i in objects.indices where objects[i].alive && objects[i].kind == .fuel {
                let o = objects[i]
                let dx = o.x - sx, dy = o.y - sy
                if dx >= 1 && dx <= 5 && dy >= 0 && dy < 28 {
                    refuelling = true
                    objects[i].fuelCounter += 1
                    stats.addFuel(11)
                    if objects[i].fuelCounter >= 26 {
                        objects[i].alive = false
                        addScore(300)
                        sound.play(.doublePing)
                    }
                    break
                }
            }
        }

        // player bullets against objects ($862F)
        for s in 0..<4 where particles[s].active && particles[s].owner == .player {
            let bx = particles[s].x >> 8, by = particles[s].y >> 8
            for i in objects.indices where objects[i].alive {
                let o = objects[i]
                let k = o.kind.rawValue
                guard bx - o.x >= 0 && bx - o.x < GameObject.hitW[k] && by - o.y >= 0 && by - o.y < GameObject.hitH[k] else { continue }
                particles[s].life = 0
                switch o.kind {
                case .gun0, .gun1, .gun2, .gun3:
                    objects[i].alive = false
                    addScore(750)
                    explode(x: (o.x + 2) << 8, y: (o.y + 4) << 8)
                case .fuel:
                    objects[i].alive = false
                    addScore(150)
                    explode(x: (o.x + 2) << 8, y: (o.y + 4) << 8)
                case .reactor:
                    explode(x: (o.x + 2) << 8, y: (o.y + 4) << 8, count: 3)
                    hitReactor()
                case .switchL, .switchR:
                    explode(x: (o.x + 2) << 8, y: (o.y + 4) << 8, count: 3)
                    level.doorTimer = 255
                case .pod:
                    break
                }
                break
            }
        }
    }

    private func fireGun(_ o: GameObject) {
        sound.play(.gunFire)
        let slot = allocParticle()
        rng.next()
        let mask = [1, 3, 7, 15][o.flags & 3]
        let base = o.flags & 0x1C
        let d = ((rng.hi & mask) + base + (rng.next() & 3)) & 31
        let dx = [4, 4, 1, 1][o.kind.rawValue], dy = [0, 8, 0, 8][o.kind.rawValue]
        var p = Particle()
        p.x = (o.x + dx) << 8; p.y = (o.y + dy) << 8
        p.vx = Tables.tx[d]; p.vy = Tables.ty[d]
        p.life = 40; p.owner = .gun
        p.px = p.x; p.py = p.y
        particles[slot] = p
    }

    private func hitReactor() {
        let sum = reactorDamage + (rng.next() & 31)
        reactorDamage = sum & 0xFF
        rechargeTimer = reactorDamage
        if sum > 0xFF && countdown < 0 {
            rechargeTimer = 255
            countdown = 10
            countdownSub = 1
        }
    }

    private func destroyPlanet() {
        planetDestroyed = true
        podTaken = true
        for i in objects.indices where objects[i].alive && objects[i].kind != .pod {
            objects[i].alive = false
            explode(x: (objects[i].x + 2) << 8, y: (objects[i].y + 4) << 8)
        }
        flash = 15
        crashShip()
    }

    // MARK: shield, tractor, pod pickup

    private func updateShieldAndPickup(_ b: Buttons) {
        shieldHeld = alive && !stats.fuelEmpty && b.contains(.shield)
        shieldShown = shieldHeld && irqFrame & 2 != 0
        if shieldShown {
            burnFuel()
            sound.play(.shield)
        }
        // pod pickup ($9926)
        guard !podTaken, alive, let pod = pod else { tractorLock = false; return }
        guard objectVisible(pod) else { tractorLock = false; return }
        let s = shipDraw
        let shipSprX = (s.x * 4) >> 8 + 6, shipSprY = (s.y * 2) >> 8
        let podSprX = pod.x * 4, podSprY = pod.y * 2
        let dx = abs(shipSprX - podSprX) & 0xFF, dy = abs(shipSprY - podSprY)
        let d = min(255, min(dx, dy) + 3 * max(dx, dy))
        if !shieldHeld { tractorLock = false; return }
        if !tractorLock {
            if d < 0x75 { tractorLock = true }
        } else if d >= 0x84 {
            tractorLock = false
            podTaken = true
            podCollectedFlag = true
            body.attach(shipX: s.x, shipY: s.y, podX: (pod.x - 2) << 8, podY: pod.y << 8)
            prevShipDraw = shipDraw
            graceTicks = 6
            sound.play(.doublePing)
        }
    }

    // MARK: fire ($A99A)

    private func updateFire(_ b: Buttons) {
        let pressed = b.contains(.fire)
        defer { if !pressed { fireLatch = false } }
        guard pressed, !fireLatch, alive, !shieldHeld else { return }
        fireLatch = true
        let slot = bulletRing
        if particles[slot].active && particles[slot].owner == .player { return }
        bulletRing = (bulletRing + 1) & 3
        let s = shipDraw
        var p = Particle()
        p.vx = Tables.tx[body.angle]; p.vy = Tables.ty[body.angle]
        p.x = s.x + (4 << 8) + 2 * p.vx
        p.y = s.y + (5 << 8) + 2 * p.vy
        p.vx += shipDelta.x
        p.vy += shipDelta.y
        p.life = 40
        p.owner = .player
        p.px = p.x - p.vx; p.py = p.y - p.vy
        particles[slot] = p
        graceTicks = max(graceTicks, 3)
        sound.play(.playerFire)
    }

    // MARK: particles ($A38E)

    private func updateParticles() {
        // stars twinkling above the surface ($A56D)
        if it & 1 == 0 && camRow < 0x200 {
            let s = allocParticle()
            var p = Particle()
            p.y = (0x64 + rng.next()) << 8
            p.x = ((camX + (rng.next() & 63) + 5) & 0xFF) << 8
            p.life = 30
            p.owner = rng.lo & 1 == 0 ? .smoke : .debris
            p.px = p.x; p.py = p.y
            if level.span(p.y >> 8).0 <= (p.x >> 8) { particles[s] = p }
        }
        let s = shipDraw
        let sx = s.x >> 8, sy = s.y >> 8
        for i in particles.indices where particles[i].active {
            particles[i].x += particles[i].vx
            particles[i].y += particles[i].vy
            particles[i].life -= 1
            let x = particles[i].x >> 8, y = particles[i].y >> 8
            let relX = x - camX, relY = y - camRow - 65
            if relX < 0 || relX >= 80 || relY < -8 || relY >= 100 || level.solid(x, y) {
                particles[i].life = 0
                continue
            }
            // gun shots against the ship ($A49F)
            if particles[i].owner == .gun && alive {
                let dx = x - sx, dy = y - sy
                if dx >= 3 && dx < 6 && dy >= 2 && dy < 7 {
                    particles[i].life = 0
                    if !shieldHeld { crashShip() }
                }
            }
        }
    }

    // MARK: collisions

    /// Sprite of the ship this iteration (pointer, top-left world pixel, colour).
    func shipSprite() -> (ptr: Int, x: Int, y: Int)? {
        guard !shipExploded else { return nil }
        let s = shipDraw
        var x = (s.x * 4) >> 8 + 6, y = (s.y * 2) >> 8 + Layout.spriteTop
        if shieldShown {
            x += Tables.tx[body.angle] / 128
            y += Tables.ty[body.angle] / 256
            return (SpritePtr.shield, x, y)
        }
        return (body.angle, x, y)
    }

    func podSprite() -> (x: Int, y: Int)? {
        guard body.podAttached && !podExploded else { return nil }
        let p = podDraw
        return ((p.x * 4) >> 8 + 6, (p.y * 2) >> 8 + Layout.spriteTop)
    }

    /// Sprites making up a level object: (pointer, colour).
    func objectSprites(_ o: GameObject) -> [(Int, UInt8)] {
        let c = level.def.colours
        switch o.kind {
        case .gun0, .gun1, .gun2, .gun3: return [(SpritePtr.gun + o.kind.rawValue, UInt8(c.gun))]
        case .fuel:
            if (o.index + 1) & 1 == 0 { return [(SpritePtr.fuelCombined, 7)] }
            return [(SpritePtr.fuelTank, 7), (SpritePtr.fuelText, UInt8(c.ship_shield))]
        case .pod:
            return podTaken ? [(SpritePtr.pedestal, UInt8(c.gun))]
                            : [(SpritePtr.podOnStand, UInt8(c.pod)), (SpritePtr.pedestal, UInt8(c.gun))]
        case .reactor:
            if countdown >= 0 && countdownSub & 4 != 0 { return [] }
            return [(SpritePtr.reactorBlock, 7), (SpritePtr.reactorDome, UInt8(c.gun))]
        case .switchL: return [(SpritePtr.switchLeftWall, 7)]
        case .switchR: return [(SpritePtr.switchRightWall, 7)]
        }
    }

    func spriteHitsTerrain(_ spr: SpriteImage, x: Int, y: Int) -> Bool {
        for r in 0..<21 where spr.rows[r] != 0 {
            let line = y + r
            guard line & 1 == 0 else { continue }
            let row = line >> 1
            let (l, rr) = level.span(row)
            for c in 0..<24 where spr.rows[r] & (0x80_0000 >> UInt32(c)) != 0 {
                let u = (x + c) >> 2
                if u < l || u >= rr { return true }
            }
        }
        return false
    }

    private func spritesOverlap(_ a: SpriteImage, _ ax: Int, _ ay: Int, _ b: SpriteImage, _ bx: Int, _ by: Int) -> Bool {
        let dx = bx - ax, dy = by - ay
        guard abs(dx) < 24 && abs(dy) < 21 else { return false }
        for r in 0..<21 {
            let br = r - dy
            guard br >= 0 && br < 21 else { continue }
            let rowA = a.rows[r]
            var rowB = b.rows[br]
            if dx > 0 { rowB >>= UInt32(dx) } else if dx < 0 { rowB = (rowB << UInt32(-dx)) & 0xFFFFFF }
            if rowA & rowB != 0 { return true }
        }
        return false
    }

    /// Test hook: put the ship (no pod) at a centre position with the given camera and report a crash.
    func probeCollision(x: Int, y: Int, angle: Int, camX: Int, camRow: Int, rod: Int = -1) -> Bool {
        body = ShipBody()
        body.x = x << 16; body.y = y << 8; body.angle = angle
        if rod >= 0 { body.podAttached = true; body.rod = rod << 16; podExploded = false }
        self.camX = camX; self.camRow = camRow
        alive = true; shipExploded = false; graceTicks = 0; tractorLock = false; shieldShown = false
        checkCollisions()
        return !alive
    }

    private func checkCollisions() {
        if graceTicks > 0 { graceTicks -= 1; return }
        guard alive else { return }
        let sprites = Assets.shared.sprites
        if let s = shipSprite() {
            let spr = sprites[s.ptr]
            if spriteHitsTerrain(spr, x: s.x, y: s.y) { crashShip(); return }
            if !body.podAttached && !tractorLock {
                for o in objects where o.alive || o.kind == .pod {
                    guard objectVisible(o) else { continue }
                    for (ptr, _) in objectSprites(o) where spritesOverlap(spr, s.x, s.y, sprites[ptr], o.x * 4, o.y * 2 + Layout.spriteTop) {
                        crashShip(); return
                    }
                }
            }
        }
        if body.podAttached, let p = podSprite() {
            let cy = body.y >> 8
            if !(cy >= 0x100 && cy < 0x178) && spriteHitsTerrain(sprites[SpritePtr.pod], x: p.x, y: p.y) {
                crashPod()
            }
        }
    }
}
