import Foundation

/// Score, fuel and ships, shared by the game flow and the world.
final class GameStats {
    var score = 0
    var lives = 3                 // spare ships shown in the status bar (4 ships in total)
    var fuel = 1000
    var fuelEmpty = false

    func reset() { score = 0; lives = 3; fuel = 1000; fuelEmpty = false }

    /// Extra ship every time the 10,000s digit changes ($92C8).
    func addScore(_ points: Int) {
        let before = score / 10000
        score += points
        if score / 10000 != before { lives = min(99, lives + 1) }
    }

    func burnFuel() {
        if fuel > 0 { fuel -= 1 }
        if fuel == 0 { fuelEmpty = true }
    }

    func addFuel(_ n: Int) { fuel = min(999_999, fuel + n) }
}

struct HighScore: Codable { var score: Int; var name: String }

final class HighScores {
    private(set) var entries: [HighScore]
    init() {
        if let d = UserDefaults.standard.data(forKey: "highscores"),
           let e = try? JSONDecoder().decode([HighScore].self, from: d), e.count == 8 {
            entries = e
        } else {
            entries = (1...8).map { HighScore(score: (9 - $0) * 1000, name: "FIREBIRD") }
        }
    }
    func rank(of score: Int) -> Int? {
        // the new score bubbles up while it is >= the entry above
        var pos = 8
        while pos > 0 && score >= entries[pos - 1].score { pos -= 1 }
        return pos < 8 ? pos : nil
    }
    func insert(_ s: HighScore, at pos: Int) {
        entries.insert(s, at: pos)
        entries.removeLast()
        if let d = try? JSONEncoder().encode(entries) { UserDefaults.standard.set(d, forKey: "highscores") }
    }
}

final class Game {
    static let tickRate = 32.55           // main-loop iterations per second on a PAL C64
    let screen: Screen
    let input: Input
    let sound = Sound()
    let stats = GameStats()
    let highScores = HighScores()
    private let status = StatusBar()

    private enum Phase { case title, playing, script, enterName }
    private var phase = Phase.title

    // planet sequence
    private var levelIndex = -1          // $A6A4
    private var reverseGravity = false   // $A6A5
    private var invisible = false        // $A5
    private var shownReverseMsg = false
    private var shownInvisibleMsg = false
    private var mission = 0              // $B681
    private var difficulty = 1           // $AF8A
    private var penalty = 0              // $AF8B
    private var rng = Rng()

    private var world: World?
    private var paused = false

    // interpolation state
    private var prevCam = (x: 0, row: 0)
    private var prevShip: (x: Int, y: Int)?
    private var prevPod: (x: Int, y: Int)?

    // timing
    private var tickAcc = 0.0
    private var irqAcc = 0.0
    private var lastButtons: Buttons = []

    // scripted message sequences
    private struct Line { let text: String; let row: Int; let col: Int; let colour: UInt8; let at: Double }
    private var lines: [Line] = []
    private var scriptTime = 0.0
    private var scriptLength = 0.0
    private var scriptShowsWorld = false
    private var scriptDone: (() -> Void)?

    // high-score entry
    private var entryRank = 0
    private var entryName = ""
    private var titleTime = 0.0

    init(screen: Screen, input: Input) {
        self.screen = screen
        self.input = input
        showTitle()
    }

    // MARK: - main update

    func update(dt: Double) {
        let b = input.poll()
        let pressed = b.subtracting(lastButtons)
        lastButtons = b

        if pressed.contains(.soundToggle) { sound.enabled.toggle() }
        if pressed.contains(.soundOff) { sound.enabled = false }
        if pressed.contains(.soundOn) { sound.enabled = true }

        irqAcc += dt
        while irqAcc >= 1 / Sound.irqRate {
            irqAcc -= 1 / Sound.irqRate
            if !paused { irqTick() }
        }

        switch phase {
        case .title:
            titleTime += dt
            if pressed.contains(.start) && titleTime > 0.3 { newGame() }
        case .playing:
            if pressed.contains(.abort) { showTitle(); return }
            if pressed.contains(.pause) { paused.toggle(); if paused { sound.silence() } }
            if pressed.contains(.resume) { paused = false }
            if paused { return }
            tickAcc += dt
            while tickAcc >= 1 / Game.tickRate {
                tickAcc -= 1 / Game.tickRate
                gameTick(b)
                if phase != .playing { break }
            }
        case .script:
            if pressed.contains(.abort) { showTitle(); return }
            scriptTime += dt
            if scriptTime >= scriptLength {
                let done = scriptDone
                scriptDone = nil
                done?()
            }
        case .enterName:
            updateNameEntry()
        }
        input.typed.removeAll()
        input.backspace = 0
        input.enter = 0
    }

    private func irqTick() {
        sound.tick()
        guard let w = world else { return }
        w.irqFrame += 1
        if w.flash > 0 && w.irqFrame & 1 == 0 { w.flash -= 1 }
    }

    private var alpha: Double { phase == .playing && !paused ? min(1, tickAcc * Game.tickRate) : 1 }

    private func gameTick(_ b: Buttons) {
        guard let w = world else { return }
        prevCam = (w.camX, w.camRow)
        prevShip = shipPixel(w)
        prevPod = podPixel(w)
        w.step(b)
        if w.wrapped {
            prevCam = (w.camX, w.camRow); prevShip = shipPixel(w); prevPod = podPixel(w)
        }
        let events = w.pendingEvents
        w.pendingEvents.removeAll()
        for e in events {
            switch e {
            case .lifeLost: lifeLost(); return
            case .leftPlanet: leftPlanet(); return
            }
        }
    }

    // MARK: - game flow

    private func showTitle() {
        phase = .title
        titleTime = 0
        paused = false
        sound.musicOn = true
        world = World(levelIndex: 0, stats: stats, sound: sound, reverseGravity: false, invisible: false,
                      fireThreshold: 0, rng: rng)
        world?.podTaken = false
        syncPrev()
    }

    private func newGame() {
        stats.reset()
        levelIndex = -1
        reverseGravity = false
        invisible = false
        shownReverseMsg = false
        shownInvisibleMsg = false
        mission = 0
        difficulty = 1
        penalty = 0
        rng = Rng(s: Int.random(in: 0...0xFFFF))
        sound.musicOn = false
        nextPlanet()
    }

    private func nextPlanet() {
        levelIndex += 1
        if levelIndex == 6 {
            levelIndex = 0
            reverseGravity.toggle()
            if !reverseGravity { invisible.toggle() }
        }
        mission += 1
        difficulty = mission >= 3 ? min(35, difficulty + 1) : difficulty
        let threshold = (mission >= 3 ? difficulty : 1) + penalty
        penalty = 0
        world = World(levelIndex: levelIndex, stats: stats, sound: sound, reverseGravity: reverseGravity,
                      invisible: invisible, fireThreshold: threshold, rng: rng)
        if reverseGravity && !shownReverseMsg {
            shownReverseMsg = true
            runScript([("REVERSE GRAVITY", 10, 12, 7, 0)], length: 3) { [weak self] in self?.beginPlay() }
        } else if invisible && !shownInvisibleMsg {
            shownInvisibleMsg = true
            runScript([("INVISIBLE LANDSCAPE", 10, 10, 7, 0)], length: 3) { [weak self] in self?.beginPlay() }
        } else {
            beginPlay()
        }
    }

    private func beginPlay() {
        phase = .playing
        tickAcc = 0
        syncPrev()
    }

    private func syncPrev() {
        guard let w = world else { return }
        prevCam = (w.camX, w.camRow)
        prevShip = shipPixel(w)
        prevPod = podPixel(w)
    }

    private func respawn() {
        guard let w = world else { return }
        w.spawn(deathY: w.body.y >> 8)
        if let r = world { rng = r.rng }
        beginPlay()
    }

    private func lifeLost() {
        guard let w = world else { return }
        if stats.fuelEmpty { gameOver(); return }
        if stats.lives == 0 { gameOver(); return }
        stats.lives -= 1
        if w.countdown >= 0 || w.planetDestroyed {
            planetFailed()
            return
        }
        // short pause while the original redraws the screen, then restart at a restart point
        runScript([], length: 1.2, showWorld: true) { [weak self] in self?.respawn() }
    }

    private func leftPlanet() {
        guard let w = world else { return }
        rng = w.rng
        if stats.fuelEmpty {
            gameOver()
            return
        }
        let m = String(mission)
        if w.body.podAttached {
            let destroyed = w.countdown >= 0
            let units = levelIndex + 5 + (destroyed ? 5 : 0)
            for _ in 0..<units { stats.addScore(400) }
            var l: [(String, Int, Int, UInt8, Double)] = [("MISSION \(m) COMPLETE", 10, 11, terrainColour, 0)]
            if destroyed { l.append(("PLANET DESTROYED", 7, 12, msgColour, 0.6)) }
            l.append(("BONUS \(units * 4)00", 13, 15, 7, 1.0))
            runScript(l, length: 3) { [weak self] in self?.nextPlanet() }
        } else if w.countdown >= 0 {
            planetFailed()
        } else {
            runScript([("MISSION INCOMPLETE", 10, 11, terrainColour, 0)], length: 2) { [weak self] in
                guard let self, let w = self.world else { return }
                w.spawn(deathY: 0)
                self.beginPlay()
            }
        }
    }

    private func planetFailed() {
        penalty = 8
        let m = String(mission)
        runScript([("PLANET DESTROYED", 7, 12, msgColour, 0),
                   ("MISSION  \(m)  FAILED", 10, 11, terrainColour, 0.6),
                   ("NO BONUS", 13, 16, 7, 1.2)], length: 3) { [weak self] in self?.nextPlanet() }
    }

    private func gameOver() {
        var l: [(String, Int, Int, UInt8, Double)] = []
        if stats.fuelEmpty { l.append(("OUT OF FUEL", 9, 14, msgColour, 0)) }
        l.append(("GAME OVER", 11, 15, 7, l.isEmpty ? 0 : 0.6))
        runScript(l, length: 2.4) { [weak self] in
            guard let self else { return }
            if let r = self.highScores.rank(of: self.stats.score) {
                self.entryRank = r
                self.entryName = ""
                self.phase = .enterName
                self.input.typed.removeAll()
            } else {
                self.showTitle()
            }
        }
    }

    private func updateNameEntry() {
        for ch in input.typed where entryName.count < 10 { entryName.append(ch) }
        if input.backspace > 0 && !entryName.isEmpty { entryName.removeLast() }
        if input.enter > 0 {
            highScores.insert(HighScore(score: stats.score, name: entryName.isEmpty ? "THRUSTER" : entryName), at: entryRank)
            showTitle()
        }
    }

    private func runScript(_ l: [(String, Int, Int, UInt8, Double)], length: Double, showWorld: Bool = false,
                           done: @escaping () -> Void) {
        lines = l.map { Line(text: $0.0, row: $0.1, col: $0.2, colour: $0.3, at: $0.4) }
        scriptTime = 0
        scriptLength = length
        scriptShowsWorld = showWorld
        scriptDone = done
        phase = .script
        sound.silence()
    }

    private var terrainColour: UInt8 { UInt8(world?.level.def.colours.terrain ?? 2) }
    private var msgColour: UInt8 { UInt8(world?.level.def.colours.gun ?? 5) }

    func debugWarp(x: Int, y: Int, level: Int?) {
        if let l = level {
            levelIndex = l - 2
            nextPlanet()
        }
        guard let w = world else { return }
        w.body.x = x << 16
        w.body.y = y << 8
        w.body.vx = 0; w.body.vy = 0
        w.camX = max(1, x - 35)
        w.camRow = y - 56 - 50
        syncPrev()
    }

    func debugNextPlanet() { nextPlanet() }
    func debugCycle() -> String {
        "mission=\(mission) idx=\(levelIndex) reverse=\(reverseGravity) invisible=\(invisible) gravity=\(world?.body.gravity ?? 0) threshold=\(world?.fireThreshold ?? 0) phase=\(phase) msg=\(lines.map { $0.text })"
    }
    func debugAngle(_ a: Int) { world?.body.angle = a & 31 }
    func debugWorld() -> World? { world }

    func debugState() -> String {
        guard let w = world else { return "no world" }
        return "phase=\(phase) lvl=\(levelIndex) x=\(w.body.x >> 16) y=\(w.body.y >> 8) vx=\(w.body.vx) vy=\(w.body.vy) ang=\(w.body.angle) cam=\(w.camX),\(w.camRow) alive=\(w.alive) pod=\(w.body.podAttached) fuel=\(stats.fuel) score=\(stats.score) lives=\(stats.lives) dmg=\(w.reactorDamage) rech=\(w.rechargeTimer) cd=\(w.countdown) hit=\(w.shipSprite().map { w.spriteHitsTerrain(Assets.shared.sprites[$0.ptr], x: $0.x, y: $0.y) } ?? false) spr=\(String(describing: w.shipSprite())) span=\(w.level.span((w.body.y >> 8)))"
    }

    // MARK: - rendering

    private func shipPixel(_ w: World) -> (x: Int, y: Int)? {
        guard let s = w.shipSprite() else { return nil }
        return (s.x, s.y)
    }
    private func podPixel(_ w: World) -> (x: Int, y: Int)? { w.podSprite() }

    private func lerp(_ a: Int, _ b: Int, _ t: Double) -> Int { a + Int((Double(b - a) * t).rounded()) }

    func render() {
        screen.clear(0)
        if let w = world {
            status.labelColour = UInt8(w.level.def.colours.status_labels)
            status.terrainColour = UInt8(w.level.def.colours.terrain)
        }
        switch phase {
        case .title:
            if let w = world { drawWorld(w, ship: false) }
            drawHighScoreTable(highlight: nil)
            screen.drawText("TOP EIGHT THRUSTERS", col: 10, row: 4, colour: msgColour)
            screen.drawText("PRESS SPACE BAR TO START", col: 7, row: 16, colour: terrainColour)
        case .playing:
            if let w = world { drawWorld(w, ship: true) }
            if paused { screen.drawCentred("PAUSED", row: 12, colour: 7) }
        case .script:
            if scriptShowsWorld, let w = world { drawWorld(w, ship: true) }
            for l in lines where scriptTime >= l.at {
                screen.drawText(l.text, col: l.col, row: l.row, colour: l.colour)
            }
        case .enterName:
            screen.drawText("CONGRATULATIONS", col: 12, row: 4, colour: msgColour)
            drawHighScoreTable(highlight: entryRank)
            screen.drawText("PLEASE ENTER YOUR NAME", col: 9, row: 16, colour: terrainColour)
        }
        var countdown: Int?
        if phase == .playing, let c = world?.countdown, c >= 0 && c < 10 { countdown = c }
        status.set(fuel: stats.fuel, lives: stats.lives, score: stats.score, countdown: countdown)
        status.draw(on: screen)
    }

    private func drawHighScoreTable(highlight: Int?) {
        var list = highScores.entries
        if let h = highlight {
            list.insert(HighScore(score: stats.score, name: entryName), at: h)
            list.removeLast()
        }
        for (i, e) in list.enumerated() {
            let s = String(e.score / 10)
            let score = String(repeating: " ", count: max(0, 6 - s.count)) + s + "0"
            var name = e.name
            if i == highlight && Int(titleTime * 4) % 2 == 0 || i == highlight && name.count < 10 { name += "." }
            screen.drawText("\(i + 1).  \(score)   \(name)", col: 9, row: 6 + i, colour: 7)
        }
    }

    private func drawWorld(_ w: World, ship: Bool) {
        let t = alpha
        let sprites = Assets.shared.sprites
        let camPx = lerp(4 * prevCam.x, 4 * w.camX, t)
        let camLine = lerp(2 * prevCam.row, 2 * w.camRow, t) + 112
        let cam = Camera(px: camPx, line: camLine)
        let colours = w.level.def.colours

        // background flash when the planet blows up
        if w.flash > 0 {
            let flashColours: [UInt8] = [6, 2, 4, 5, 3, 7, 1, 1, 7, 3, 5, 4, 2, 6, 0]
            let c = flashColours[max(0, min(14, 15 - w.flash))]
            screen.fillRect(0, Layout.playTop, Screen.width, Layout.playBottom - Layout.playTop + 1, c)
        }

        // landscape (hidden on invisible planets unless the shield is on or the ship is exploding)
        let hidden = (w.invisible && !w.shieldHeld && w.alive) || (w.planetDestroyed && w.flash == 0)
        screen.drawTerrain(level: w.level, cam: cam, colour: UInt8(colours.terrain), invisible: hidden)

        // level objects
        for o in w.objects where o.alive || o.kind == .pod {
            guard w.objectVisible(o) else { continue }
            for (ptr, c) in w.objectSprites(o) {
                screen.drawSprite(sprites[ptr], x: o.x * 4 - cam.px, y: o.y * 2 + Layout.spriteTop - cam.line, colour: c)
            }
        }

        // particles: 1 multicolour pixel x 2 lines
        for p in w.particles where p.active {
            let x = lerp(p.px, p.x, t), y = lerp(p.py, p.y, t)
            let sx = (x >> 8) * 4 + ((x >> 7) & 1) * 2 - cam.px
            let sy = (y >> 8) * 2 - cam.line
            let c: UInt8
            switch p.owner {
            case .smoke: c = 7
            case .debris: c = UInt8(colours.pod)
            case .player, .gun: c = w.invisible ? UInt8(colours.pod) : UInt8(colours.terrain)
            }
            for yy in sy...sy + 1 where yy >= Layout.playTop && yy <= Layout.playBottom {
                screen.set(sx, yy, c); screen.set(sx + 1, yy, c)
            }
        }
        guard ship else { return }

        // ship, pod and the tow rod
        let shipNow = shipPixel(w), podNow = podPixel(w)
        func interp(_ prev: (x: Int, y: Int)?, _ cur: (x: Int, y: Int)?) -> (x: Int, y: Int)? {
            guard let c = cur else { return nil }
            guard let p = prev else { return c }
            return (lerp(p.x, c.x, t), lerp(p.y, c.y, t))
        }
        let sp = interp(prevShip, shipNow)
        let pp = interp(prevPod, podNow)
        if w.body.podAttached, let a = sp ?? shipNow.map({ $0 }), let b = pp {
            screen.drawLine(a.x + 12 - cam.px, a.y + 10 - cam.line, b.x + 12 - cam.px, b.y + 10 - cam.line,
                            colour: UInt8(colours.terrain))
        } else if w.tractorLock, let a = sp, let pod = w.pod {
            screen.drawLine(a.x + 12 - cam.px, a.y + 10 - cam.line, pod.x * 4 + 10 - cam.px, pod.y * 2 + 8 - cam.line,
                            colour: UInt8(colours.terrain))
        }
        if let b = pp, !w.podExploded {
            screen.drawSprite(sprites[SpritePtr.pod], x: b.x - cam.px, y: b.y - cam.line, colour: UInt8(colours.pod))
        }
        if let s = w.shipSprite(), let a = sp {
            let colour: UInt8 = s.ptr == SpritePtr.shield ? UInt8(colours.ship_shield) : 7
            screen.drawSprite(sprites[s.ptr], x: a.x - cam.px, y: a.y - cam.line, colour: colour)
            if w.refuelling && w.it & 1 == 0 {
                screen.drawSprite(sprites[SpritePtr.fuelBeam], x: a.x - cam.px, y: a.y + 21 - cam.line, colour: 7)
            }
        }
    }
}
