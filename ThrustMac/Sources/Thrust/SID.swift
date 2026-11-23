import AVFoundation

/// A small MOS 6581 SID approximation: three voices with triangle/saw/pulse/noise waveforms,
/// ring modulation, hard sync and ADSR envelopes. Register writes come from the game thread
/// and are applied by the audio render callback.
final class SID {
    static let clock = 985_248.0          // PAL C64 CPU clock

    private struct Voice {
        var freq: UInt32 = 0              // 16-bit frequency register
        var pw: UInt32 = 0                // 12-bit pulse width
        var control: UInt8 = 0
        var attack: Int = 0, decay: Int = 0, sustain: Int = 0, release: Int = 0
        var acc: UInt32 = 0               // 24-bit phase accumulator
        var noise: UInt32 = 0x7FFFF8      // 23-bit LFSR
        var env: Double = 0
        var state = 0                     // 0 attack, 1 decay/sustain, 2 release
        var gate = false
    }

    // Envelope times in seconds (attack) per the SID datasheet; decay/release are 3x.
    private static let attackTimes: [Double] = [0.002, 0.008, 0.016, 0.024, 0.038, 0.056, 0.068, 0.080,
                                                0.100, 0.250, 0.500, 0.800, 1.0, 3.0, 5.0, 8.0]

    private var voices = [Voice](repeating: Voice(), count: 3)
    private var volume = 15
    private var filterCutoff = 0      // 11-bit
    private var filterRoute = 0       // voices routed through the filter
    private var filterMode = 0        // $D418 bits 4-6: LP, BP, HP
    private var svfLow = 0.0, svfBand = 0.0
    private var regs = [UInt8](repeating: 0, count: 32)
    private let lock = NSLock()
    private var pending: [(Int, UInt8)] = []
    private let sampleRate: Double
    private var engine: AVAudioEngine?
    var muted = false

    init() {
        let engine = AVAudioEngine()
        let format = engine.outputNode.inputFormat(forBus: 0)
        sampleRate = format.sampleRate > 0 ? format.sampleRate : 44100
        let mono = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1)!
        let node = AVAudioSourceNode(format: mono) { [unowned self] _, _, frameCount, abl -> OSStatus in
            let buffers = UnsafeMutableAudioBufferListPointer(abl)
            guard let out = buffers.first?.mData?.assumingMemoryBound(to: Float.self) else { return noErr }
            self.render(out, Int(frameCount))
            for b in buffers.dropFirst() {
                b.mData?.copyMemory(from: out, byteCount: Int(frameCount) * MemoryLayout<Float>.size)
            }
            return noErr
        }
        engine.attach(node)
        engine.connect(node, to: engine.mainMixerNode, format: mono)
        engine.mainMixerNode.outputVolume = 0.5
        do {
            try engine.start()
            self.engine = engine
        } catch {
            NSLog("Audio unavailable: \(error)")
        }
    }

    func write(_ reg: Int, _ value: UInt8) {
        lock.lock(); pending.append((reg & 31, value)); lock.unlock()
    }

    func reset() {
        for r in 0..<25 { write(r, 0) }
    }

    private func apply(_ reg: Int, _ v: UInt8) {
        regs[reg] = v
        if reg < 21 {
            let n = reg / 7, r = reg % 7
            switch r {
            case 0: voices[n].freq = (voices[n].freq & 0xFF00) | UInt32(v)
            case 1: voices[n].freq = (voices[n].freq & 0x00FF) | UInt32(v) << 8
            case 2: voices[n].pw = (voices[n].pw & 0xF00) | UInt32(v)
            case 3: voices[n].pw = (voices[n].pw & 0x0FF) | UInt32(v & 15) << 8
            case 4:
                let gate = v & 1 != 0
                if gate && !voices[n].gate { voices[n].state = 0 }
                if !gate && voices[n].gate { voices[n].state = 2 }
                voices[n].gate = gate
                voices[n].control = v
                if v & 8 != 0 { voices[n].acc = 0 }
            case 5: voices[n].attack = Int(v >> 4); voices[n].decay = Int(v & 15)
            case 6: voices[n].sustain = Int(v >> 4); voices[n].release = Int(v & 15)
            default: break
            }
        } else if reg == 21 {
            filterCutoff = (filterCutoff & ~7) | Int(v & 7)
        } else if reg == 22 {
            filterCutoff = (filterCutoff & 7) | Int(v) << 3
        } else if reg == 23 {
            filterRoute = Int(v & 7)
        } else if reg == 24 {
            volume = Int(v & 15)
            filterMode = Int(v >> 4) & 7
        }
    }

    private func render(_ out: UnsafeMutablePointer<Float>, _ count: Int) {
        lock.lock()
        let writes = pending
        pending.removeAll(keepingCapacity: true)
        lock.unlock()
        for (r, v) in writes { apply(r, v) }

        let cyclesPerSample = SID.clock / sampleRate
        let dt = 1.0 / sampleRate
        let vol = muted ? 0.0 : Double(volume) / 15.0
        // state-variable filter approximating the 6581 curve (~30 Hz .. ~12 kHz)
        let fc = min(sampleRate * 0.45, 30.0 + Double(filterCutoff) * 5.8)
        let fcoef = 2 * sin(Double.pi * fc / sampleRate)
        for i in 0..<count {
            var mix = 0.0
            var filtered = 0.0
            let step = UInt32(cyclesPerSample.rounded())
            var msb = [Bool](repeating: false, count: 3)
            for n in 0..<3 {
                let prev = voices[n].acc
                if voices[n].control & 8 == 0 {
                    voices[n].acc = (voices[n].acc &+ voices[n].freq &* step) & 0xFFFFFF
                }
                // noise LFSR clocks on accumulator bit 19 rising edges
                let clocks = Int((voices[n].acc >> 19) &- (prev >> 19)) & 0x1F
                for _ in 0..<clocks {
                    let bit = ((voices[n].noise >> 22) ^ (voices[n].noise >> 17)) & 1
                    voices[n].noise = ((voices[n].noise << 1) | bit) & 0x7FFFFF
                }
                msb[n] = voices[n].acc & 0x800000 != 0
                if voices[n].acc < prev, voices[(n + 1) % 3].control & 2 != 0 {
                    voices[(n + 1) % 3].acc = 0       // hard sync of the next voice
                }
            }
            for n in 0..<3 {
                var v = voices[n]
                // envelope
                switch v.state {
                case 0:
                    v.env += dt / SID.attackTimes[v.attack]
                    if v.env >= 1 { v.env = 1; v.state = 1 }
                case 1:
                    let target = Double(v.sustain) / 15.0
                    if v.env > target {
                        v.env -= dt / (SID.attackTimes[v.decay] * 3) * 1.0
                        if v.env < target { v.env = target }
                    }
                default:
                    v.env -= dt / (SID.attackTimes[v.release] * 3)
                    if v.env < 0 { v.env = 0 }
                }
                let acc = v.acc
                var sample = 0.0
                var count = 0
                let c = v.control
                if c & 0x10 != 0 {   // triangle
                    var t = acc >> 11 & 0xFFF
                    let ringMSB = c & 4 != 0 ? msb[(n + 2) % 3] : false
                    if (acc & 0x800000 != 0) != ringMSB { t = (~t) & 0xFFF }
                    t = (t << 1) & 0xFFF
                    sample += Double(t) / 2048.0 - 1.0; count += 1
                }
                if c & 0x20 != 0 { sample += Double(acc >> 12) / 2048.0 - 1.0; count += 1 }
                if c & 0x40 != 0 { sample += (acc >> 12) >= v.pw ? 1.0 : -1.0; count += 1 }
                if c & 0x80 != 0 { sample += Double((v.noise >> 15) & 0xFF) / 128.0 - 1.0; count += 1 }
                if count > 1 { sample /= Double(count) }
                if filterRoute & (1 << n) != 0 { filtered += sample * v.env } else { mix += sample * v.env }
                voices[n] = v
            }
            if filterRoute != 0 {
                let high = filtered - svfLow - 1.4 * svfBand
                svfBand += fcoef * high
                svfLow += fcoef * svfBand
                if filterMode & 1 != 0 { mix += svfLow }
                if filterMode & 2 != 0 { mix += svfBand }
                if filterMode & 4 != 0 { mix += high }
            }
            out[i] = Float(mix * vol * 0.3)
        }
    }
}
