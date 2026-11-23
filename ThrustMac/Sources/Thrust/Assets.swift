import Foundation

/// A 24x21 hires C64 sprite.
struct SpriteImage {
    var rows: [UInt32]          // 21 rows, bit 23 = leftmost pixel

    init(bytes: ArraySlice<UInt8>) {
        let b = Array(bytes)
        var rows = [UInt32]()
        for r in 0..<21 {
            let hi = UInt32(b[r * 3]) << 16
            let mid = UInt32(b[r * 3 + 1]) << 8
            rows.append(hi | mid | UInt32(b[r * 3 + 2]))
        }
        self.rows = rows
    }

    @inline(__always) func pixel(_ x: Int, _ y: Int) -> Bool {
        guard x >= 0, x < 24, y >= 0, y < 21 else { return false }
        return rows[y] & (0x80_0000 >> UInt32(x)) != 0
    }
}

struct LevelObjectDef: Decodable {
    let type: Int
    let x: Int
    let y: Int
    let flags: Int
}

struct RestartPoint: Decodable {
    let ship_x: Int
    let ship_y: Int
    let camera_x: Int
    let camera_row: Int
}

struct LevelColours: Decodable {
    let terrain: Int
    let pod: Int
    let status_labels: Int
    let gun: Int
    let ship_shield: Int
}

struct LevelDef: Decodable {
    let height: Int
    let spans: [Int]
    let gravity: Int
    let colours: LevelColours
    let restart: [RestartPoint]
    let objects: [LevelObjectDef]
}

private struct LevelsFile: Decodable { let levels: [LevelDef] }

/// Sprite pointer numbers in the original VIC bank.
enum SpritePtr {
    static let shield = 32
    static let pod = 33
    static let gun = 34          // + variant 0..3
    static let fuelTank = 38
    static let fuelText = 39
    static let podOnStand = 40
    static let pedestal = 41
    static let reactorBlock = 42
    static let reactorDome = 43
    static let switchLeftWall = 44
    static let switchRightWall = 45
    static let fuelCombined = 46
    static let fuelBeam = 47
}

final class Assets {
    static let shared = Assets()
    let levels: [LevelDef]
    let sprites: [SpriteImage]
    let gameRAM: [UInt8]        // RAM image of the running original game
    let startRAM: [UInt8]       // RAM image right after unpacking (music player at song start)
    /// 37 glyphs ". A-Z 0-9", 5 rows of 8 hires pixels each ($8E52, stored planar).
    let font: [[UInt8]]
    /// 2 KB status bar charset ($5800).
    let charset: [UInt8]

    private init() {
        func load(_ name: String) -> Data {
            let url = Bundle.module.url(forResource: name, withExtension: nil, subdirectory: "Resources")
                ?? Bundle.module.url(forResource: name, withExtension: nil)
            guard let url, let data = try? Data(contentsOf: url) else { fatalError("missing resource \(name)") }
            return data
        }
        levels = try! JSONDecoder().decode(LevelsFile.self, from: load("levels.json")).levels
        let spr = [UInt8](load("sprites.bin"))
        sprites = (0..<spr.count / 64).map { SpriteImage(bytes: spr[$0 * 64 ..< $0 * 64 + 63]) }
        let ram = [UInt8](load("c64_game.bin"))
        gameRAM = ram
        startRAM = [UInt8](load("c64_start.bin"))
        font = (0..<37).map { g in (0..<5).map { r in ram[0x8E52 + g + 37 * r] } }
        charset = Array(ram[0x5800..<0x6000])
    }
}
