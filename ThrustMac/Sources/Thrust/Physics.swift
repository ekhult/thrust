import Foundation

/// Exact port of the original ship / pod physics (one main-loop iteration at 32.55 Hz).
/// Units follow the C64 code: x is 24-bit with 16 fraction bits (1 unit = 4 hires px),
/// y is 24-bit with 8 fraction bits (1 unit = 2 raster lines).
enum Tables {
    static let ty = [-640, -627, -591, -532, -452, -355, -244, -124, 0, 124, 244, 355, 452, 532, 591, 627,
                     640, 627, 591, 532, 452, 355, 244, 124, 0, -124, -244, -355, -452, -532, -591, -627]
    static let tx = [0, 62, 122, 177, 226, 266, 295, 313, 320, 313, 295, 266, 226, 177, 122, 62,
                     0, -62, -122, -177, -226, -266, -295, -313, -320, -313, -295, -266, -226, -177, -122, -62]

    /// $967D / $98D4: sum of `n` samples switching from table[i] to table[i+1] after (n - k) samples.
    static func interp(_ table: [Int], _ a16: Int, _ n: Int = 16) -> Int {
        var i = (a16 >> 8) & 31
        let k = (a16 & 0xFF) >> 4
        var s = table[i]
        var x = n - 2
        while x >= 0 {
            if k == x + 1 { i = (i + 1) & 31 }
            s += table[i]
            x -= 1
        }
        return s
    }
}

@inline(__always) func s24(_ v: Int) -> Int { let m = v & 0xFFFFFF; return m & 0x800000 != 0 ? m - 0x1000000 : m }
@inline(__always) func s16(_ v: Int) -> Int { let m = v & 0xFFFF; return m & 0x8000 != 0 ? m - 0x10000 : m }

struct ShipBody {
    var x = 0, y = 0            // centre of the ship(+pod) system
    var vx = 0, vy = 0
    var angle = 0
    var rod = 0, av = 0         // rod angle (1/65536 of a direction step) and angular velocity
    var podAttached = false
    var rodLength = 14          // $54
    var gravity = 5

    static let physicsTicks: Set<Int> = [0, 3, 5, 8, 11, 13]

    /// $9E09 rotation, runs 3 of 4 iterations.
    mutating func rotate(it: Int, dir: Int) {
        if it & 3 != 0 { angle = (angle + dir) & 31 }
    }

    /// $9E28 position integration.
    mutating func integrate(alive: Bool) {
        x = (x + vx) & 0xFFFFFF
        y = (y + vy) & 0xFFFFFF
        if !alive || podAttached { rod = (rod + av) & 0x1FFFFF }
    }

    /// $9588 velocity update. Returns true if a unit of fuel was burnt.
    mutating func updateVelocity(it: Int, alive: Bool, wreckStopped: Bool, thrust: Bool, hasFuel: Bool) -> Bool {
        let t = it & 15
        var burnt = false
        if !alive && !podAttached && wreckStopped {
            vy = 0
            vx &= 0xFF
        } else if ShipBody.physicsTicks.contains(t) {
            vy = s16(vy + gravity)
            if alive && hasFuel && thrust {
                burnt = true
                let sh = podAttached ? 5 : 4
                vx = s24(vx + ((Tables.tx[angle] * 256) >> sh))
                vy = s16(vy + (Tables.ty[angle] >> sh))
                if t != 3 && t != 11 {
                    let d = ((angle << 8) - (rod >> 8) + 8) & 0x1FFF
                    let torque = Tables.interp(Tables.tx, d) >> 1
                    av = s24(av + torque - (av >> 6) - 1)
                }
            }
            vx = s24(vx - (vx >> 6))
            vy = s16(vy - (vy >> 8))
        }
        return burnt
    }

    /// $98B2: offset of the ship from the centre (pod = centre - offset), in 1/256 X / Y units.
    func offset() -> (Int, Int) {
        let a = ((rod >> 8) + 8) & 0x1FFF
        let n = rodLength + 2
        if n <= 0 { return (0, 0) }
        return (Tables.interp(Tables.tx, a, n) >> 2, Tables.interp(Tables.ty, a, n) >> 2)
    }

    /// Ship draw position in 1/256 units (X: 16.8 from the 24-bit centre, Y: 16.8).
    func shipPosition() -> (x: Int, y: Int) {
        let (ox, oy) = offset()
        return ((x >> 8) + ox, y + oy)
    }

    func podPosition() -> (x: Int, y: Int) {
        let (ox, oy) = offset()
        return ((x >> 8) - ox, y - oy)
    }

    /// $995F: attaching the pod. `shipX/shipY` are the ship draw position (16.8 fixed point),
    /// `podX/podY` the pod (16.8). Port of the original including its search quirk.
    mutating func attach(shipX: Int, shipY: Int, podX: Int, podY: Int) {
        // centre = midpoint
        let cx = (shipX + podX) >> 1               // 16.8
        let cy = (shipY + podY + 0x80) >> 1
        x = (cx << 8) & 0xFFFFFF
        y = cy & 0xFFFFFF
        // halve velocities (equal masses)
        vy = vy >> 1
        vx = vx >> 1
        // ship - centre, scaled to pixels / lines (8-bit signed)
        let relX = ((((shipX - cx) & 0xFFFF) << 2) >> 8) & 0xFF
        let relY = ((((shipY - cy) & 0xFFFF) << 1) >> 8) & 0xFF
        // coarse-to-fine search for the best rod angle
        var sHi = 0x0A, sLo = 0xAB
        var rLo = 0, rHi = 0
        var levels = 7
        func absdiff(_ p: Int, _ q: Int) -> Int {
            var r = p - q
            let c = r < 0 ? 0 : 1
            r &= 255
            if r & 0x80 != 0 { r = ((r ^ 0xFF) + 1 + c) & 255 }
            return r
        }
        while true {
            var best = 0xFF
            var bLo = rLo, bHi = rHi
            for _ in 0..<3 {
                let a16 = (((rHi << 8) | rLo) + 8) & 0x1FFF
                sLo = (rLo + 8) & 255                      // original clobbers the step's low byte
                let ox = (Tables.interp(Tables.tx, a16, rodLength + 2) >> 2) & 0xFFFF
                let oy = (Tables.interp(Tables.ty, a16, rodLength + 2) >> 2) & 0xFFFF
                let ax = ((ox << 2) >> 8) & 255
                let ay = ((oy << 1) >> 8) & 255
                let dx = absdiff(ax, relX), dy = absdiff(ay, relY)
                let d = min(255, min(dx, dy) + 3 * max(dx, dy))
                if d < best { best = d; bLo = rLo; bHi = rHi }
                let t = rLo + sLo
                rLo = t & 255
                rHi = (rHi + sHi + (t >> 8)) & 31
            }
            rLo = bLo; rHi = bHi
            let st = ((sHi << 8) | sLo) >> 1
            sHi = st >> 8; sLo = st & 255
            levels -= 1
            if levels == 0 { break }
            let r = (((rHi << 8) | rLo) - st) & 0x1FFF
            rHi = r >> 8; rLo = r & 255
        }
        rod = ((rHi << 8) | rLo) << 8
        // angular velocity from v x r
        func sx8(_ v: Int) -> Int { let m = v & 255; return m & 0x80 != 0 ? m - 256 : m }
        let vx16 = sx8(vx >> 12)
        let vy16 = sx8(vy >> 4)
        let p = s16(sx8(vy16) * sx8(relX) - sx8(vx16) * sx8(relY)) >> 2
        av = s24((p << 8) | (av & 0xFF))
        podAttached = true
    }
}
