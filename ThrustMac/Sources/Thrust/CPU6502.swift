import Foundation

/// A compact NMOS 6502 interpreter. It is only used to run the original game's music / sound-effect
/// driver against a SID, so it has no cycle accuracy or I/O beyond a write hook for $D400-$D41F.
final class CPU6502 {
    var mem = [UInt8](repeating: 0, count: 65536)
    var a: UInt8 = 0, x: UInt8 = 0, y: UInt8 = 0, sp: UInt8 = 0xFF
    var pc: UInt16 = 0
    var c = false, z = false, i = true, d = false, v = false, n = false
    var onSIDWrite: ((Int, UInt8) -> Void)?

    @inline(__always) func rd(_ addr: UInt16) -> UInt8 { mem[Int(addr)] }
    @inline(__always) func wr(_ addr: UInt16, _ val: UInt8) {
        if addr >= 0xD400 && addr < 0xD420 { onSIDWrite?(Int(addr - 0xD400), val) }
        mem[Int(addr)] = val
    }
    @inline(__always) private func fetch() -> UInt8 { let b = mem[Int(pc)]; pc &+= 1; return b }
    @inline(__always) private func fetchW() -> UInt16 { let lo = UInt16(fetch()); return lo | UInt16(fetch()) << 8 }
    @inline(__always) private func push(_ b: UInt8) { mem[0x100 + Int(sp)] = b; sp &-= 1 }
    @inline(__always) private func pull() -> UInt8 { sp &+= 1; return mem[0x100 + Int(sp)] }
    @inline(__always) private func nz(_ b: UInt8) -> UInt8 { z = b == 0; n = b & 0x80 != 0; return b }

    private var p: UInt8 {
        get { (n ? 0x80 : 0) | (v ? 0x40 : 0) | 0x30 | (d ? 8 : 0) | (i ? 4 : 0) | (z ? 2 : 0) | (c ? 1 : 0) }
        set { n = newValue & 0x80 != 0; v = newValue & 0x40 != 0; d = newValue & 8 != 0
              i = newValue & 4 != 0; z = newValue & 2 != 0; c = newValue & 1 != 0 }
    }

    /// Calls a subroutine and runs until it returns (or a step budget is exhausted).
    func call(_ addr: UInt16, a: UInt8 = 0, x: UInt8 = 0, y: UInt8 = 0, maxSteps: Int = 200_000) {
        self.a = a; self.x = x; self.y = y
        sp = 0xFF
        push(0xFF); push(0xFE)          // return address $FFFF -> RTS lands at $FFFF... sentinel
        pc = addr
        var steps = 0
        while steps < maxSteps {
            if pc == 0xFFFF { return }
            step()
            steps += 1
        }
    }

    // MARK: addressing
    private func zp() -> UInt16 { UInt16(fetch()) }
    private func zpx() -> UInt16 { UInt16(fetch() &+ x) }
    private func zpy() -> UInt16 { UInt16(fetch() &+ y) }
    private func abs() -> UInt16 { fetchW() }
    private func abx() -> UInt16 { fetchW() &+ UInt16(x) }
    private func aby() -> UInt16 { fetchW() &+ UInt16(y) }
    private func izx() -> UInt16 {
        let zpAddr = fetch() &+ x
        return UInt16(mem[Int(zpAddr)]) | UInt16(mem[Int(zpAddr &+ 1)]) << 8
    }
    private func izy() -> UInt16 {
        let zpAddr = fetch()
        let base = UInt16(mem[Int(zpAddr)]) | UInt16(mem[Int(zpAddr &+ 1)]) << 8
        return base &+ UInt16(y)
    }

    private func adc(_ m: UInt8) {
        if d {
            var lo = Int(a & 0xF) + Int(m & 0xF) + (c ? 1 : 0)
            var hi = Int(a >> 4) + Int(m >> 4)
            if lo > 9 { lo += 6; hi += 1 }
            z = (Int(a) + Int(m) + (c ? 1 : 0)) & 0xFF == 0
            n = (hi << 4) & 0x80 != 0
            v = ((Int(a) ^ (hi << 4)) & ~(Int(a) ^ Int(m)) & 0x80) != 0
            if hi > 9 { hi += 6 }
            c = hi > 15
            a = UInt8(((hi << 4) | (lo & 0xF)) & 0xFF)
            return
        }
        let r = Int(a) + Int(m) + (c ? 1 : 0)
        v = (~(Int(a) ^ Int(m)) & (Int(a) ^ r) & 0x80) != 0
        c = r > 0xFF
        a = nz(UInt8(r & 0xFF))
    }
    private func sbc(_ m: UInt8) {
        if d {
            let r = Int(a) - Int(m) - (c ? 0 : 1)
            var lo = Int(a & 0xF) - Int(m & 0xF) - (c ? 0 : 1)
            var hi = Int(a >> 4) - Int(m >> 4)
            if lo < 0 { lo -= 6; hi -= 1 }
            if hi < 0 { hi -= 6 }
            v = ((Int(a) ^ r) & (Int(a) ^ Int(m)) & 0x80) != 0
            c = r >= 0
            _ = nz(UInt8(r & 0xFF))
            a = UInt8(((hi << 4) | (lo & 0xF)) & 0xFF)
            return
        }
        adc(~m)
    }
    private func cmp(_ r: UInt8, _ m: UInt8) { c = r >= m; _ = nz(r &- m) }
    private func branch(_ cond: Bool) {
        let off = Int8(bitPattern: fetch())
        if cond { pc = UInt16(truncatingIfNeeded: Int(pc) + Int(off)) }
    }
    private func asl(_ m: UInt8) -> UInt8 { c = m & 0x80 != 0; return nz(m << 1) }
    private func lsr(_ m: UInt8) -> UInt8 { c = m & 1 != 0; return nz(m >> 1) }
    private func rol(_ m: UInt8) -> UInt8 { let r = (m << 1) | (c ? 1 : 0); c = m & 0x80 != 0; return nz(r) }
    private func ror(_ m: UInt8) -> UInt8 { let r = (m >> 1) | (c ? 0x80 : 0); c = m & 1 != 0; return nz(r) }
    private func rmw(_ addr: UInt16, _ f: (UInt8) -> UInt8) { wr(addr, f(rd(addr))) }
    private func bit(_ m: UInt8) { n = m & 0x80 != 0; v = m & 0x40 != 0; z = a & m == 0 }

    // swiftlint:disable:next cyclomatic_complexity function_body_length
    func step() {
        let op = fetch()
        switch op {
        // ORA AND EOR ADC SBC CMP LDA
        case 0x09: a = nz(a | fetch())
        case 0x05: a = nz(a | rd(zp())); case 0x15: a = nz(a | rd(zpx())); case 0x0D: a = nz(a | rd(abs()))
        case 0x1D: a = nz(a | rd(abx())); case 0x19: a = nz(a | rd(aby())); case 0x01: a = nz(a | rd(izx()))
        case 0x11: a = nz(a | rd(izy()))
        case 0x29: a = nz(a & fetch())
        case 0x25: a = nz(a & rd(zp())); case 0x35: a = nz(a & rd(zpx())); case 0x2D: a = nz(a & rd(abs()))
        case 0x3D: a = nz(a & rd(abx())); case 0x39: a = nz(a & rd(aby())); case 0x21: a = nz(a & rd(izx()))
        case 0x31: a = nz(a & rd(izy()))
        case 0x49: a = nz(a ^ fetch())
        case 0x45: a = nz(a ^ rd(zp())); case 0x55: a = nz(a ^ rd(zpx())); case 0x4D: a = nz(a ^ rd(abs()))
        case 0x5D: a = nz(a ^ rd(abx())); case 0x59: a = nz(a ^ rd(aby())); case 0x41: a = nz(a ^ rd(izx()))
        case 0x51: a = nz(a ^ rd(izy()))
        case 0x69: adc(fetch())
        case 0x65: adc(rd(zp())); case 0x75: adc(rd(zpx())); case 0x6D: adc(rd(abs()))
        case 0x7D: adc(rd(abx())); case 0x79: adc(rd(aby())); case 0x61: adc(rd(izx())); case 0x71: adc(rd(izy()))
        case 0xE9, 0xEB: sbc(fetch())
        case 0xE5: sbc(rd(zp())); case 0xF5: sbc(rd(zpx())); case 0xED: sbc(rd(abs()))
        case 0xFD: sbc(rd(abx())); case 0xF9: sbc(rd(aby())); case 0xE1: sbc(rd(izx())); case 0xF1: sbc(rd(izy()))
        case 0xC9: cmp(a, fetch())
        case 0xC5: cmp(a, rd(zp())); case 0xD5: cmp(a, rd(zpx())); case 0xCD: cmp(a, rd(abs()))
        case 0xDD: cmp(a, rd(abx())); case 0xD9: cmp(a, rd(aby())); case 0xC1: cmp(a, rd(izx())); case 0xD1: cmp(a, rd(izy()))
        case 0xE0: cmp(x, fetch()); case 0xE4: cmp(x, rd(zp())); case 0xEC: cmp(x, rd(abs()))
        case 0xC0: cmp(y, fetch()); case 0xC4: cmp(y, rd(zp())); case 0xCC: cmp(y, rd(abs()))
        case 0xA9: a = nz(fetch())
        case 0xA5: a = nz(rd(zp())); case 0xB5: a = nz(rd(zpx())); case 0xAD: a = nz(rd(abs()))
        case 0xBD: a = nz(rd(abx())); case 0xB9: a = nz(rd(aby())); case 0xA1: a = nz(rd(izx())); case 0xB1: a = nz(rd(izy()))
        case 0xA2: x = nz(fetch()); case 0xA6: x = nz(rd(zp())); case 0xB6: x = nz(rd(zpy()))
        case 0xAE: x = nz(rd(abs())); case 0xBE: x = nz(rd(aby()))
        case 0xA0: y = nz(fetch()); case 0xA4: y = nz(rd(zp())); case 0xB4: y = nz(rd(zpx()))
        case 0xAC: y = nz(rd(abs())); case 0xBC: y = nz(rd(abx()))
        // stores
        case 0x85: wr(zp(), a); case 0x95: wr(zpx(), a); case 0x8D: wr(abs(), a); case 0x9D: wr(abx(), a)
        case 0x99: wr(aby(), a); case 0x81: wr(izx(), a); case 0x91: wr(izy(), a)
        case 0x86: wr(zp(), x); case 0x96: wr(zpy(), x); case 0x8E: wr(abs(), x)
        case 0x84: wr(zp(), y); case 0x94: wr(zpx(), y); case 0x8C: wr(abs(), y)
        case 0x24: bit(rd(zp())); case 0x2C: bit(rd(abs()))
        // shifts / inc / dec
        case 0x0A: a = asl(a); case 0x4A: a = lsr(a); case 0x2A: a = rol(a); case 0x6A: a = ror(a)
        case 0x06: rmw(zp(), asl); case 0x16: rmw(zpx(), asl); case 0x0E: rmw(abs(), asl); case 0x1E: rmw(abx(), asl)
        case 0x46: rmw(zp(), lsr); case 0x56: rmw(zpx(), lsr); case 0x4E: rmw(abs(), lsr); case 0x5E: rmw(abx(), lsr)
        case 0x26: rmw(zp(), rol); case 0x36: rmw(zpx(), rol); case 0x2E: rmw(abs(), rol); case 0x3E: rmw(abx(), rol)
        case 0x66: rmw(zp(), ror); case 0x76: rmw(zpx(), ror); case 0x6E: rmw(abs(), ror); case 0x7E: rmw(abx(), ror)
        case 0xE6: rmw(zp()) { self.nz($0 &+ 1) }; case 0xF6: rmw(zpx()) { self.nz($0 &+ 1) }
        case 0xEE: rmw(abs()) { self.nz($0 &+ 1) }; case 0xFE: rmw(abx()) { self.nz($0 &+ 1) }
        case 0xC6: rmw(zp()) { self.nz($0 &- 1) }; case 0xD6: rmw(zpx()) { self.nz($0 &- 1) }
        case 0xCE: rmw(abs()) { self.nz($0 &- 1) }; case 0xDE: rmw(abx()) { self.nz($0 &- 1) }
        case 0xE8: x = nz(x &+ 1); case 0xCA: x = nz(x &- 1); case 0xC8: y = nz(y &+ 1); case 0x88: y = nz(y &- 1)
        // transfers / stack / flags
        case 0xAA: x = nz(a); case 0x8A: a = nz(x); case 0xA8: y = nz(a); case 0x98: a = nz(y)
        case 0xBA: x = nz(sp); case 0x9A: sp = x
        case 0x48: push(a); case 0x68: a = nz(pull()); case 0x08: push(p); case 0x28: p = pull()
        case 0x18: c = false; case 0x38: c = true; case 0x58: i = false; case 0x78: i = true
        case 0xB8: v = false; case 0xD8: d = false; case 0xF8: d = true
        // branches / jumps
        case 0x10: branch(!n); case 0x30: branch(n); case 0x50: branch(!v); case 0x70: branch(v)
        case 0x90: branch(!c); case 0xB0: branch(c); case 0xD0: branch(!z); case 0xF0: branch(z)
        case 0x4C: pc = fetchW()
        case 0x6C:
            let ad = fetchW()
            let hiAddr = (ad & 0xFF00) | ((ad &+ 1) & 0x00FF)
            pc = UInt16(rd(ad)) | UInt16(rd(hiAddr)) << 8
        case 0x20:
            let target = fetchW()
            let ret = pc &- 1
            push(UInt8(ret >> 8)); push(UInt8(ret & 0xFF))
            pc = target
        case 0x60:
            let lo = UInt16(pull()); let hi = UInt16(pull())
            pc = ((hi << 8) | lo) &+ 1
        case 0x40:
            p = pull(); let lo = UInt16(pull()); let hi = UInt16(pull()); pc = (hi << 8) | lo
        case 0x00:
            pc = 0xFFFF   // treat BRK as "return to host"
        // NOPs (official and common illegal ones)
        case 0xEA, 0x1A, 0x3A, 0x5A, 0x7A, 0xDA, 0xFA: break
        case 0x80, 0x82, 0x89, 0xC2, 0xE2, 0x04, 0x44, 0x64, 0x14, 0x34, 0x54, 0x74, 0xD4, 0xF4: pc &+= 1
        case 0x0C, 0x1C, 0x3C, 0x5C, 0x7C, 0xDC, 0xFC: pc &+= 2
        default:
            pc = 0xFFFF   // unknown opcode: bail out
        }
    }
}
