import Foundation

extension Screen {
    /// Draws text with the original 8x5 font. Positions are in C64 character cells (col 0-39, row 0-24),
    /// glyphs start at the top of the cell like the original message printer.
    func drawText(_ text: String, col: Int, row: Int, colour: UInt8) {
        drawTextPx(text, x: col * 8, y: row * 8, colour: colour)
    }

    func drawTextPx(_ text: String, x: Int, y: Int, colour: UInt8) {
        let font = Assets.shared.font
        var cx = x
        for ch in text.uppercased() {
            if let g = Screen.glyphIndex(ch) {
                for r in 0..<5 {
                    let bits = font[g][r]
                    for b in 0..<8 where bits & (0x80 >> b) != 0 { set(cx + b, y + r, colour) }
                }
            }
            cx += 8
        }
    }

    /// Text centred horizontally on a character row.
    func drawCentred(_ text: String, row: Int, colour: UInt8) {
        drawTextPx(text, x: (Screen.width - text.count * 8) / 2, y: row * 8, colour: colour)
    }

    static func glyphIndex(_ ch: Character) -> Int? {
        guard let a = ch.asciiValue else { return 0 }
        switch a {
        case 0x20: return nil
        case 0x30...0x39: return Int(a) - 0x30 + 27
        case 0x41...0x5A: return Int(a) - 0x41 + 1
        default: return 0
        }
    }
}

/// The status bar is an 80-character picture drawn in multicolour text mode from the $5800 charset;
/// the numbers are printed into the charset with the text font, just like the original.
final class StatusBar {
    private var chars: [UInt8]
    var labelColour: UInt8 = 5
    var terrainColour: UInt8 = 2

    init() {
        chars = Assets.shared.charset
    }

    /// Prints `text` into consecutive character cells starting at char `first` (5 rows from byte offset 1).
    private func print(_ text: String, first: Int) {
        let font = Assets.shared.font
        for (i, ch) in text.enumerated() {
            let base = (first + i) * 8 + 1
            let g = Screen.glyphIndex(ch)
            for r in 0..<5 { chars[base + r] = g.map { font[$0][r] } ?? 0 }
        }
    }

    private static func pad(_ v: Int, _ width: Int) -> String {
        let s = String(v)
        return String(repeating: " ", count: max(0, width - s.count)) + s
    }

    func set(fuel: Int, lives: Int, score: Int, countdown: Int?) {
        print(StatusBar.pad(fuel, 6), first: 43)
        print(StatusBar.pad(lives, 2), first: 58)
        print(score >= 10 ? StatusBar.pad(score / 10, 6) : "      ", first: 68)
        let c = countdown.map { String($0) } ?? " "
        print(c, first: 53)
        print(c, first: 65)
    }

    func draw(on screen: Screen) {
        // colour RAM layout of the original status rows
        let ram = Assets.shared.gameRAM
        func colourRAM(_ row: Int, _ col: Int) -> UInt8 {
            switch (row, col) {
            case (0, 5...8), (0, 17...21), (0, 30...34): return labelColour     // $A801
            default: return ram[0xD800 + row * 40 + col] & 15
            }
        }
        let bg: [UInt8] = [0, 0, terrainColour]   // $D021, $D022, $D023
        for row in 0..<3 {
            for col in 0..<40 {
                let code = row < 2 ? row * 40 + col : 0x50
                let cram = colourRAM(row, col)
                for line in 0..<8 {
                    let y = row * 8 + line
                    if y >= Layout.playTop { break }
                    let bits = chars[code * 8 + line]
                    if cram & 8 != 0 {
                        for p in 0..<4 {
                            let pair = Int(bits >> UInt8(6 - p * 2)) & 3
                            let c = pair == 3 ? cram & 7 : bg[pair]
                            screen.set(col * 8 + p * 2, y, c)
                            screen.set(col * 8 + p * 2 + 1, y, c)
                        }
                    } else {
                        for p in 0..<8 {
                            screen.set(col * 8 + p, y, bits & (0x80 >> UInt8(p)) != 0 ? cram : 0)
                        }
                    }
                }
            }
        }
    }
}
