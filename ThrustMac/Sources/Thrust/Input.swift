import AppKit
import GameController

/// Logical buttons of the original game.
struct Buttons: OptionSet {
    let rawValue: UInt16
    static let left = Buttons(rawValue: 1)       // A: rotate anticlockwise
    static let right = Buttons(rawValue: 2)      // S: rotate clockwise
    static let thrust = Buttons(rawValue: 4)     // SHIFT
    static let fire = Buttons(rawValue: 8)       // RETURN
    static let shield = Buttons(rawValue: 16)    // SPACE: tractor beam / shield
    static let pause = Buttons(rawValue: 32)
    static let abort = Buttons(rawValue: 64)     // RUN/STOP
    static let soundToggle = Buttons(rawValue: 128)
    static let start = Buttons(rawValue: 256)
    static let resume = Buttons(rawValue: 512)
    static let soundOff = Buttons(rawValue: 1024)
    static let soundOn = Buttons(rawValue: 2048)
}

final class Input {
    private(set) var held: Buttons = []
    private var keys = Set<UInt16>()
    private var shift = false
    /// Characters typed since last poll (for high-score name entry).
    var typed: [Character] = []
    var backspace = 0
    var enter = 0
    /// Buttons injected by the autotest driver.
    var forced: Buttons? 

    // macOS virtual key codes
    private static let map: [UInt16: Buttons] = [
        0: .left, 123: .left,            // A, ←
        1: .right, 124: .right,          // S, →
        126: .thrust,                    // ↑ (shift handled via flags)
        36: .fire, 76: .fire,            // Return, Enter
        49: .shield, 125: .shield,       // Space, ↓
        53: .abort,                      // Esc = RUN/STOP
        35: .pause, 96: .pause,          // P, F5 pause
        98: .resume,                     // F7 continue
        46: .soundToggle,                // M
        122: .soundOff, 99: .soundOn,    // F1 sound off, F3 sound on
    ]

    func keyDown(_ e: NSEvent) {
        if !e.isARepeat {
            keys.insert(e.keyCode)
            if e.keyCode == 51 { backspace += 1 }
            if e.keyCode == 36 || e.keyCode == 76 { enter += 1 }
            if let s = e.charactersIgnoringModifiers {
                for ch in s.uppercased() where ch.isLetter || ch.isNumber || ch == " " || ch == "." { typed.append(ch) }
            }
        }
    }
    func keyUp(_ e: NSEvent) { keys.remove(e.keyCode) }
    func flags(_ e: NSEvent) {
        shift = e.modifierFlags.contains(.shift) || e.modifierFlags.contains(.control)
    }
    func releaseAll() { keys.removeAll(); shift = false }

    func poll() -> Buttons {
        if let f = forced { held = f; return f }
        var b: Buttons = []
        for k in keys { if let m = Input.map[k] { b.insert(m) } }
        if shift { b.insert(.thrust) }
        if b.contains(.fire) || b.contains(.shield) { b.insert(.start) }
        for c in GCController.controllers() {
            guard let g = c.extendedGamepad else { continue }
            let x = g.leftThumbstick.xAxis.value + g.dpad.xAxis.value
            if x < -0.4 { b.insert(.left) }
            if x > 0.4 { b.insert(.right) }
            if g.buttonA.isPressed || g.rightTrigger.isPressed || g.leftThumbstick.yAxis.value > 0.6 || g.dpad.up.isPressed { b.insert(.thrust) }
            if g.buttonB.isPressed || g.rightShoulder.isPressed { b.insert(.fire) }
            if g.buttonX.isPressed || g.leftTrigger.isPressed || g.leftShoulder.isPressed { b.insert(.shield) }
            if g.buttonMenu.isPressed { b.insert(.start) }
        }
        held = b
        return b
    }
}
