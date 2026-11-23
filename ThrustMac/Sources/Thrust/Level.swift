import Foundation

/// The landscape of a planet: every row y has one open interval L <= x < R (x in 4-pixel units).
/// Rows are 2 raster lines apart and only the even line is drawn, which gives Thrust its striped look.
final class Level {
    let index: Int              // 0..5
    let def: LevelDef
    let height: Int
    private let left: [Int]
    private let right: [Int]

    // door state ($6B timer, $6C opening)
    var doorTimer = 0
    var doorOpen = 0

    init(index: Int) {
        self.index = index
        def = Assets.shared.levels[index]
        height = def.height
        var l = [Int](), r = [Int]()
        for i in stride(from: 0, to: def.spans.count, by: 2) {
            l.append(def.spans[i]); r.append(def.spans[i + 1])
        }
        left = l; right = r
    }

    struct Door { let first: Int; let last: Int; let max: Int }

    var door: Door? {
        switch index {
        case 3: return Door(first: 617, last: 629, max: 16)
        case 4: return Door(first: 836, last: 856, max: 21)
        case 5: return Door(first: 880, last: 894, max: 18)
        default: return nil
        }
    }

    /// Open span of a row (doors applied).
    @inline(__always) func span(_ y: Int) -> (Int, Int) {
        if y < 0 { return (0, 255) }
        if y >= height { return (0, 0) }
        var l = left[y]
        let r = right[y]
        if let d = door, y >= d.first, y <= d.last {
            let o = doorOpen
            switch index {
            case 3: l = 174 - o
            case 4: l = (y - 835) <= o ? 152 : 166
            default:
                let k = y - 880, c = 192 - o
                l = k < 7 ? c + k : c + 14 - k
            }
        }
        return (l, r)
    }

    /// True if the 4-pixel unit x of row y is rock.
    @inline(__always) func solid(_ x: Int, _ y: Int) -> Bool {
        let (l, r) = span(y)
        return x < l || x >= r
    }

    /// $917D: door animation, once per game iteration.
    func updateDoor(cameraRow: Int) {
        guard let d = door else { return }
        if doorTimer > 0 { doorTimer -= 1 }
        let rel = d.first - (index == 4 ? 1 : 0) - cameraRow
        guard rel >= 0 && rel <= 240 else { return }
        if doorTimer >= d.max { doorOpen = min(doorOpen + 1, d.max) } else { doorOpen = doorTimer }
    }
}
