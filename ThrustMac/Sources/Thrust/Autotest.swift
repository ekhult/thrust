import Foundation
import ImageIO
import UniformTypeIdentifiers

/// Headless test driver: `Thrust --autotest <dir> <script>` runs the game with scripted input and
/// writes screenshots. Script lines: "<seconds> <action>" where action is "keys A,THRUST,..." or "shot name"
/// or "level N" (warp) or "quit".
enum Autotest {
    static func run(dir: String, script: String) {
        let screen = Screen()
        let input = Input()
        let game = Game(screen: screen, input: input)
        var events: [(Double, String)] = []
        for line in script.split(separator: "\n") {
            let parts = line.split(separator: " ", maxSplits: 1).map(String.init)
            guard parts.count == 2, let t = Double(parts[0]) else { continue }
            events.append((t, parts[1]))
        }
        events.sort { $0.0 < $1.0 }
        var t = 0.0
        let dt = 1.0 / 60
        var idx = 0
        while idx < events.count {
            while idx < events.count && events[idx].0 <= t {
                let a = events[idx].1
                idx += 1
                if a.hasPrefix("keys") {
                    let names = a.dropFirst(4).split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
                    var b: Buttons = []
                    for n in names {
                        switch n {
                        case "LEFT": b.insert(.left)
                        case "RIGHT": b.insert(.right)
                        case "THRUST": b.insert(.thrust)
                        case "FIRE": b.insert(.fire)
                        case "SHIELD": b.insert(.shield)
                        case "START": b.insert(.start)
                        default: break
                        }
                    }
                    input.forced = b
                } else if a.hasPrefix("shot") {
                    game.render()
                    save(screen, "\(dir)/\(a.dropFirst(5)).png")
                } else if a.hasPrefix("warp") {
                    let n = a.split(separator: " ").compactMap { Int($0) }
                    game.debugWarp(x: n[0], y: n[1], level: n.count > 2 ? n[2] : nil)
                } else if a.hasPrefix("angle") {
                    game.debugAngle(Int(a.split(separator: " ")[1])!)
                } else if a.hasPrefix("damage") {
                    game.debugWorld()?.reactorDamage = 250
                } else if a.hasPrefix("door") {
                    game.debugWorld()?.level.doorTimer = 255
                } else if a.hasPrefix("skip") {
                    for _ in 0..<(Int(a.split(separator: " ")[1]) ?? 1) { game.debugNextPlanet() }
                } else if a.hasPrefix("cycle") {
                    print(game.debugCycle())
                } else if a.hasPrefix("eval") {
                    print(game.debugState())
                } else if a.hasPrefix("quit") {
                    return
                }
            }
            game.update(dt: dt)
            t += dt
        }
    }

    static func save(_ screen: Screen, _ path: String) {
        guard let small = screen.makeImage(),
              let ctx = CGContext(data: nil, width: Screen.width * 3, height: Screen.height * 3, bitsPerComponent: 8,
                                  bytesPerRow: 0, space: CGColorSpaceCreateDeviceRGB(),
                                  bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else { return }
        ctx.interpolationQuality = .none
        ctx.draw(small, in: CGRect(x: 0, y: 0, width: Screen.width * 3, height: Screen.height * 3))
        guard let img = ctx.makeImage(),
              let dest = CGImageDestinationCreateWithURL(URL(fileURLWithPath: path) as CFURL, UTType.png.identifier as CFString, 1, nil)
        else { return }
        CGImageDestinationAddImage(dest, img, nil)
        CGImageDestinationFinalize(dest)
    }
}
