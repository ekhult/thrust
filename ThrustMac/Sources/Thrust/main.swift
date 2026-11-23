import AppKit

let args = CommandLine.arguments
if let i = args.firstIndex(of: "--autotest"), args.count > i + 2 {
    let script = (try? String(contentsOfFile: args[i + 2], encoding: .utf8)) ?? ""
    Autotest.run(dir: args[i + 1], script: script)
    exit(0)
}

if let i = args.firstIndex(of: "--probe"), args.count > i + 2 {
    // collision probes: lines "level x y angle hit camX camRow" (output of tools/collide/probe_orig.py)
    let input = (try? String(contentsOfFile: args[i + 1], encoding: .utf8)) ?? ""
    var out = ""
    var worlds: [Int: World] = [:]
    let stats = GameStats()
    let sound = Sound()
    for line in input.split(separator: "\n") {
        let n = line.split(separator: " ").compactMap { Int($0) }
        guard n.count >= 7 else { continue }
        // optional rod angle column (pod attached)
        let rod = n.count >= 8 ? n[4] : -1
        let (camX, camRow) = n.count >= 8 ? (n[6], n[7]) : (n[5], n[6])
        let w = worlds[n[0]] ?? World(levelIndex: n[0], stats: stats, sound: sound, reverseGravity: false,
                                      invisible: false, fireThreshold: 0, rng: Rng())
        worlds[n[0]] = w
        let hit = w.probeCollision(x: n[1], y: n[2], angle: n[3], camX: camX, camRow: camRow, rod: rod)
        out += "\(line) \(hit ? 1 : 0)\n"
    }
    try? out.write(toFile: args[i + 2], atomically: true, encoding: .utf8)
    exit(0)
}

if args.contains("--soundtest") {
    var writes = 0
    let cpu = CPU6502()
    cpu.mem = Assets.shared.startRAM
    cpu.mem[0x63] = 0xFF; cpu.mem[0xA2] = 0
    cpu.onSIDWrite = { _, _ in writes += 1 }
    var regs = [[UInt8]]()
    for _ in 0..<500 { cpu.call(0x2000); regs.append(Array(cpu.mem[0xD400..<0xD419])) }
    print("music writes over 500 calls:", writes, "pc", String(cpu.pc, radix: 16))
    print(regs[499].map { String(format: "%02x", $0) }.joined())
    let sfx = CPU6502()
    sfx.mem = Assets.shared.gameRAM
    sfx.mem[0x63] = 0; sfx.mem[0xA2] = 0
    for a in 0x9B45..<0x9B4B { sfx.mem[a] = 0 }
    var w2 = 0
    sfx.onSIDWrite = { _, _ in w2 += 1 }
    sfx.call(0x9D3D)
    for _ in 0..<5 { sfx.call(0x9B58) }
    print("sfx writes:", w2, Array(sfx.mem[0xD407..<0xD40E]).map { String(format: "%02x", $0) }.joined())
    exit(0)
}

let app = NSApplication.shared
app.setActivationPolicy(.regular)
let delegate = AppDelegate()
app.delegate = delegate
app.run()
