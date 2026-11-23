import Foundation

/// Plays the original game's audio by running its own 6502 code against the SID emulation:
/// Rob Hubbard's title music player ($2000) and the in-game sound-effect driver ($9B58), both called
/// at the PAL raster-interrupt rate (50.125 Hz) exactly as the C64 did.
final class Sound {
    enum Effect: UInt16 {
        case playerFire = 0x9D3D
        case gunFire = 0x9D85
        case explosion = 0x9C94
        case thrust = 0x9CCF
        case shield = 0x9D07
        case ping = 0x9C75
        case doublePing = 0x9DC4
    }

    static let irqRate = 50.125
    let sid = SID()
    private let music = CPU6502()
    private let sfx = CPU6502()
    private var pendingEffects: [Effect] = []
    var musicOn = false {
        didSet { if musicOn != oldValue { silence() } }
    }
    var enabled = UserDefaults.standard.object(forKey: "sound") as? Bool ?? true {
        didSet { sid.muted = !enabled; UserDefaults.standard.set(enabled, forKey: "sound") }
    }

    init() {
        let assets = Assets.shared
        music.mem = assets.startRAM
        music.mem[0x63] = 0xFF        // title / attract mode: music enabled
        music.mem[0xA2] = 0           // sound not switched off
        sfx.mem = assets.gameRAM
        sfx.mem[0x63] = 0             // in game
        sfx.mem[0xA2] = 0
        for a in 0x9B45..<0x9B4B { sfx.mem[a] = 0 }   // all effect timers idle
        sfx.mem[0x9B55] = 0x80; sfx.mem[0x9B56] = 0x40
        let s = sid
        music.onSIDWrite = { [weak self] r, v in if self?.musicOn == true { s.write(r, v) } }
        sfx.onSIDWrite = { [weak self] r, v in if self?.musicOn == false { s.write(r, v) } }
        sid.muted = !enabled
    }

    func play(_ e: Effect) {
        if !musicOn { pendingEffects.append(e) }
    }

    func silence() {
        for v in 0..<3 { sid.write(v * 7 + 4, 0) }
        pendingEffects.removeAll()
        for a in 0x9B45..<0x9B4B { sfx.mem[a] = 0 }
    }

    /// One raster-IRQ worth of audio work.
    func tick() {
        if musicOn {
            music.call(0x2000)
        } else {
            for e in pendingEffects { sfx.call(e.rawValue) }
            pendingEffects.removeAll()
            sfx.mem[0x1A] &+= 1
            sfx.call(0x9B58)
        }
    }
}
