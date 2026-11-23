import Foundation

/// Draws the playfield the way the C64 did: a striped multicolour landscape and hires sprites.
/// Positions are in hires world pixels (x = 4 * unit, y = 2 * row), the camera may be fractional
/// so the remake can scroll smoothly between game iterations.
struct Camera {
    var px: Int        // world hires pixel shown at screen x = 0
    var line: Int      // world line shown at screen y = 0
}

enum Layout {
    static let playTop = 18          // first screen line of the playfield
    static let playBottom = 199      // last screen line (inclusive)
    /// A sprite at row Y starts on world line 2Y+3: the VIC draws a sprite from raster line Y+1, and the game
    /// runs the playfield with vertical fine scroll 0 (bitmap line 0 = raster 48). Verified against the
    /// original's hardware collisions (tools/collide).
    static let spriteTop = 3
    /// world line of terrain row y = 2y; screen line = world - cameraLine
    /// the original shows rows camera_row+65 ... at screen line 18 -> cameraLine = 2*camera_row + 112
    static func cameraLine(row: Double) -> Int { Int((2 * row).rounded(.down)) + 112 }
}

extension Screen {
    func drawTerrain(level: Level, cam: Camera, colour: UInt8, invisible: Bool) {
        if invisible { return }
        for sy in Layout.playTop...Layout.playBottom {
            let wl = sy + cam.line
            guard wl & 1 == 0 else { continue }
            let row = wl >> 1
            let (l, r) = level.span(row)
            let base = sy * Screen.width
            // open interval in screen pixels
            let ol = l * 4 - cam.px, or = r * 4 - cam.px
            if ol > 0 {
                let e = min(Screen.width, ol)
                for x in 0..<e { pixels[base + x] = colour }
            }
            if or < Screen.width {
                for x in max(0, or)..<Screen.width { pixels[base + x] = colour }
            }
        }
    }

    /// Draws a sprite with its top-left at screen (x, y), clipped to the playfield.
    func drawSprite(_ s: SpriteImage, x: Int, y: Int, colour: UInt8, clipTop: Int = Layout.playTop) {
        for r in 0..<21 {
            let sy = y + r
            guard sy >= clipTop, sy <= Layout.playBottom else { continue }
            let bits = s.rows[r]
            if bits == 0 { continue }
            for c in 0..<24 where bits & (0x80_0000 >> UInt32(c)) != 0 {
                let sx = x + c
                if sx >= 0 && sx < Screen.width { pixels[sy * Screen.width + sx] = colour }
            }
        }
    }

    /// 1-pixel line (used for the tow rod / tractor line).
    func drawLine(_ x0: Int, _ y0: Int, _ x1: Int, _ y1: Int, colour: UInt8) {
        var x0 = x0, y0 = y0
        let dx = abs(x1 - x0), dy = -abs(y1 - y0)
        let sx = x0 < x1 ? 1 : -1, sy = y0 < y1 ? 1 : -1
        var err = dx + dy
        while true {
            if y0 >= Layout.playTop && y0 <= Layout.playBottom { set(x0, y0, colour) }
            if x0 == x1 && y0 == y1 { break }
            let e2 = 2 * err
            if e2 >= dy { err += dy; x0 += sx }
            if e2 <= dx { err += dx; y0 += sy }
        }
    }
}
