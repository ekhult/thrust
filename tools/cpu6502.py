"""Compact NMOS 6502 emulator (documented opcodes + common illegal NOPs/LAX/SAX) for unpacking & tracing."""

class CPU:
    def __init__(self, mem=None):
        self.m = mem if mem is not None else bytearray(65536)
        self.a = self.x = self.y = 0
        self.sp = 0xff
        self.pc = 0
        self.c = self.z = self.i = self.d = self.v = self.n = 0
        self.cycles = 0
        self.read_hook = None
        self.write_hook = None
        self._build()

    # memory
    def rd(self, a):
        if self.read_hook:
            r = self.read_hook(a)
            if r is not None:
                return r
        return self.m[a]
    def wr(self, a, v):
        if self.write_hook and self.write_hook(a, v):
            return
        self.m[a] = v & 0xff
    def rw(self, a):
        return self.rd(a) | self.rd((a + 1) & 0xffff) << 8
    def rwzp(self, a):
        return self.rd(a & 0xff) | self.rd((a + 1) & 0xff) << 8

    def push(self, v):
        self.m[0x100 + self.sp] = v & 0xff
        self.sp = (self.sp - 1) & 0xff
    def pull(self):
        self.sp = (self.sp + 1) & 0xff
        return self.m[0x100 + self.sp]

    def getp(self, b=1):
        return (self.n << 7) | (self.v << 6) | 0x20 | (b << 4) | (self.d << 3) | (self.i << 2) | (self.z << 1) | self.c
    def setp(self, p):
        self.n = p >> 7 & 1; self.v = p >> 6 & 1; self.d = p >> 3 & 1
        self.i = p >> 2 & 1; self.z = p >> 1 & 1; self.c = p & 1

    def nz(self, v):
        v &= 0xff
        self.n = v >> 7
        self.z = int(v == 0)
        return v

    def irq(self, vec=0xfffe):
        self.push(self.pc >> 8); self.push(self.pc & 0xff); self.push(self.getp(0))
        self.i = 1
        self.pc = self.rw(vec)

    # addressing: return effective address
    def _build(self):
        S = self
        def fetch():
            v = S.m[S.pc]; S.pc = (S.pc + 1) & 0xffff; return v
        def fetchw():
            v = S.m[S.pc] | S.m[(S.pc + 1) & 0xffff] << 8; S.pc = (S.pc + 2) & 0xffff; return v
        modes = {
            'imm': lambda: (S.pc, setattr(S, 'pc', (S.pc + 1) & 0xffff))[0],
            'zp': lambda: fetch(),
            'zpx': lambda: (fetch() + S.x) & 0xff,
            'zpy': lambda: (fetch() + S.y) & 0xff,
            'abs': lambda: fetchw(),
            'abx': lambda: (fetchw() + S.x) & 0xffff,
            'aby': lambda: (fetchw() + S.y) & 0xffff,
            'izx': lambda: S.rwzp((fetch() + S.x) & 0xff),
            'izy': lambda: (S.rwzp(fetch()) + S.y) & 0xffff,
        }
        S.modes = modes
        ops = {}
        def adc(v):
            if S.d:
                lo = (S.a & 0xf) + (v & 0xf) + S.c
                hi = (S.a >> 4) + (v >> 4)
                if lo > 9: lo += 6; hi += 1
                bin_ = S.a + v + S.c
                S.z = int((bin_ & 0xff) == 0)
                S.n = (hi << 4 >> 7) & 1
                S.v = int(((S.a ^ (hi << 4)) & ~(S.a ^ v) & 0x80) != 0)
                if hi > 9: hi += 6
                S.c = int(hi > 15)
                S.a = ((hi << 4) | (lo & 0xf)) & 0xff
                return
            r = S.a + v + S.c
            S.v = int(((S.a ^ r) & (v ^ r) & 0x80) != 0)
            S.c = int(r > 0xff)
            S.a = S.nz(r)
        def sbc(v):
            if S.d:
                r = S.a - v - (1 - S.c)
                lo = (S.a & 0xf) - (v & 0xf) - (1 - S.c)
                hi = (S.a >> 4) - (v >> 4)
                if lo < 0: lo -= 6; hi -= 1
                if hi < 0: hi -= 6
                S.v = int(((S.a ^ r) & (S.a ^ v) & 0x80) != 0)
                S.c = int(r >= 0)
                S.nz(r)
                S.a = ((hi << 4) | (lo & 0xf)) & 0xff
                return
            adc(v ^ 0xff)
        def cmp(r, v):
            t = r - v
            S.c = int(t >= 0)
            S.nz(t)
        def branch(cond):
            off = fetch()
            if cond:
                if off >= 0x80: off -= 256
                S.pc = (S.pc + off) & 0xffff
        def rmw(mode, f):
            def op():
                if mode == 'acc':
                    S.a = f(S.a)
                else:
                    a = modes[mode]()
                    S.wr(a, f(S.rd(a)))
            return op
        def asl(v): S.c = v >> 7; return S.nz(v << 1)
        def lsr(v): S.c = v & 1; return S.nz(v >> 1)
        def rol(v): r = (v << 1) | S.c; S.c = v >> 7; return S.nz(r)
        def ror(v): r = (v >> 1) | (S.c << 7); S.c = v & 1; return S.nz(r)
        def inc(v): return S.nz(v + 1)
        def dec(v): return S.nz(v - 1)

        table = {
            'ora': [(0x09,'imm'),(0x05,'zp'),(0x15,'zpx'),(0x0d,'abs'),(0x1d,'abx'),(0x19,'aby'),(0x01,'izx'),(0x11,'izy')],
            'and': [(0x29,'imm'),(0x25,'zp'),(0x35,'zpx'),(0x2d,'abs'),(0x3d,'abx'),(0x39,'aby'),(0x21,'izx'),(0x31,'izy')],
            'eor': [(0x49,'imm'),(0x45,'zp'),(0x55,'zpx'),(0x4d,'abs'),(0x5d,'abx'),(0x59,'aby'),(0x41,'izx'),(0x51,'izy')],
            'adc': [(0x69,'imm'),(0x65,'zp'),(0x75,'zpx'),(0x6d,'abs'),(0x7d,'abx'),(0x79,'aby'),(0x61,'izx'),(0x71,'izy')],
            'sbc': [(0xe9,'imm'),(0xe5,'zp'),(0xf5,'zpx'),(0xed,'abs'),(0xfd,'abx'),(0xf9,'aby'),(0xe1,'izx'),(0xf1,'izy'),(0xeb,'imm')],
            'cmp': [(0xc9,'imm'),(0xc5,'zp'),(0xd5,'zpx'),(0xcd,'abs'),(0xdd,'abx'),(0xd9,'aby'),(0xc1,'izx'),(0xd1,'izy')],
            'cpx': [(0xe0,'imm'),(0xe4,'zp'),(0xec,'abs')],
            'cpy': [(0xc0,'imm'),(0xc4,'zp'),(0xcc,'abs')],
            'lda': [(0xa9,'imm'),(0xa5,'zp'),(0xb5,'zpx'),(0xad,'abs'),(0xbd,'abx'),(0xb9,'aby'),(0xa1,'izx'),(0xb1,'izy')],
            'ldx': [(0xa2,'imm'),(0xa6,'zp'),(0xb6,'zpy'),(0xae,'abs'),(0xbe,'aby')],
            'ldy': [(0xa0,'imm'),(0xa4,'zp'),(0xb4,'zpx'),(0xac,'abs'),(0xbc,'abx')],
            'lax': [(0xa7,'zp'),(0xb7,'zpy'),(0xaf,'abs'),(0xbf,'aby'),(0xa3,'izx'),(0xb3,'izy')],
            'sta': [(0x85,'zp'),(0x95,'zpx'),(0x8d,'abs'),(0x9d,'abx'),(0x99,'aby'),(0x81,'izx'),(0x91,'izy')],
            'stx': [(0x86,'zp'),(0x96,'zpy'),(0x8e,'abs')],
            'sty': [(0x84,'zp'),(0x94,'zpx'),(0x8c,'abs')],
            'sax': [(0x87,'zp'),(0x97,'zpy'),(0x8f,'abs'),(0x83,'izx')],
            'bit': [(0x24,'zp'),(0x2c,'abs')],
            'nop': [(0x04,'zp'),(0x44,'zp'),(0x64,'zp'),(0x0c,'abs'),(0x14,'zpx'),(0x34,'zpx'),(0x54,'zpx'),(0x74,'zpx'),(0xd4,'zpx'),(0xf4,'zpx'),
                    (0x1c,'abx'),(0x3c,'abx'),(0x5c,'abx'),(0x7c,'abx'),(0xdc,'abx'),(0xfc,'abx'),(0x80,'imm'),(0x82,'imm'),(0x89,'imm'),(0xc2,'imm'),(0xe2,'imm')],
        }
        def mk(name, mode):
            m = modes[mode]
            if name == 'ora': return lambda: setattr(S, 'a', S.nz(S.a | S.rd(m())))
            if name == 'and': return lambda: setattr(S, 'a', S.nz(S.a & S.rd(m())))
            if name == 'eor': return lambda: setattr(S, 'a', S.nz(S.a ^ S.rd(m())))
            if name == 'adc': return lambda: adc(S.rd(m()))
            if name == 'sbc': return lambda: sbc(S.rd(m()))
            if name == 'cmp': return lambda: cmp(S.a, S.rd(m()))
            if name == 'cpx': return lambda: cmp(S.x, S.rd(m()))
            if name == 'cpy': return lambda: cmp(S.y, S.rd(m()))
            if name == 'lda': return lambda: setattr(S, 'a', S.nz(S.rd(m())))
            if name == 'ldx': return lambda: setattr(S, 'x', S.nz(S.rd(m())))
            if name == 'ldy': return lambda: setattr(S, 'y', S.nz(S.rd(m())))
            if name == 'lax':
                def f():
                    v = S.nz(S.rd(m())); S.a = v; S.x = v
                return f
            if name == 'sta': return lambda: S.wr(m(), S.a)
            if name == 'stx': return lambda: S.wr(m(), S.x)
            if name == 'sty': return lambda: S.wr(m(), S.y)
            if name == 'sax': return lambda: S.wr(m(), S.a & S.x)
            if name == 'nop': return lambda: m()
            if name == 'bit':
                def f():
                    v = S.rd(m()); S.n = v >> 7; S.v = v >> 6 & 1; S.z = int((S.a & v) == 0)
                return f
        for name, lst in table.items():
            for opc, mode in lst:
                ops[opc] = mk(name, mode)
        for base, f in ((0x00, asl), (0x20, rol), (0x40, lsr), (0x60, ror)):
            ops[base + 0x0a] = rmw('acc', f)
            ops[base + 0x06] = rmw('zp', f); ops[base + 0x16] = rmw('zpx', f)
            ops[base + 0x0e] = rmw('abs', f); ops[base + 0x1e] = rmw('abx', f)
        for opc, mode in ((0xe6,'zp'),(0xf6,'zpx'),(0xee,'abs'),(0xfe,'abx')): ops[opc] = rmw(mode, inc)
        for opc, mode in ((0xc6,'zp'),(0xd6,'zpx'),(0xce,'abs'),(0xde,'abx')): ops[opc] = rmw(mode, dec)
        def setr(r, v): setattr(S, r, S.nz(v))
        ops[0xe8] = lambda: setr('x', S.x + 1); ops[0xca] = lambda: setr('x', S.x - 1)
        ops[0xc8] = lambda: setr('y', S.y + 1); ops[0x88] = lambda: setr('y', S.y - 1)
        ops[0xaa] = lambda: setr('x', S.a); ops[0x8a] = lambda: setr('a', S.x)
        ops[0xa8] = lambda: setr('y', S.a); ops[0x98] = lambda: setr('a', S.y)
        ops[0xba] = lambda: setr('x', S.sp); ops[0x9a] = lambda: setattr(S, 'sp', S.x)
        ops[0x48] = lambda: S.push(S.a); ops[0x68] = lambda: setr('a', S.pull())
        ops[0x08] = lambda: S.push(S.getp(1)); ops[0x28] = lambda: S.setp(S.pull())
        ops[0x18] = lambda: setattr(S, 'c', 0); ops[0x38] = lambda: setattr(S, 'c', 1)
        ops[0x58] = lambda: setattr(S, 'i', 0); ops[0x78] = lambda: setattr(S, 'i', 1)
        ops[0xb8] = lambda: setattr(S, 'v', 0)
        ops[0xd8] = lambda: setattr(S, 'd', 0); ops[0xf8] = lambda: setattr(S, 'd', 1)
        for opc in (0xea, 0x1a, 0x3a, 0x5a, 0x7a, 0xda, 0xfa): ops[opc] = lambda: None
        ops[0x10] = lambda: branch(not S.n); ops[0x30] = lambda: branch(S.n)
        ops[0x50] = lambda: branch(not S.v); ops[0x70] = lambda: branch(S.v)
        ops[0x90] = lambda: branch(not S.c); ops[0xb0] = lambda: branch(S.c)
        ops[0xd0] = lambda: branch(not S.z); ops[0xf0] = lambda: branch(S.z)
        ops[0x4c] = lambda: setattr(S, 'pc', fetchw())
        def jmpi():
            a = fetchw()
            S.pc = S.rd(a) | S.rd((a & 0xff00) | ((a + 1) & 0xff)) << 8
        ops[0x6c] = jmpi
        def jsr():
            a = fetchw()
            r = (S.pc - 1) & 0xffff
            S.push(r >> 8); S.push(r & 0xff)
            S.pc = a
        ops[0x20] = jsr
        def rts():
            lo = S.pull(); hi = S.pull()
            S.pc = ((hi << 8 | lo) + 1) & 0xffff
        ops[0x60] = rts
        def rti():
            S.setp(S.pull()); lo = S.pull(); hi = S.pull()
            S.pc = hi << 8 | lo
        ops[0x40] = rti
        def brk():
            S.pc = (S.pc + 1) & 0xffff
            S.push(S.pc >> 8); S.push(S.pc & 0xff); S.push(S.getp(1)); S.i = 1
            S.pc = S.rw(0xfffe)
        ops[0x00] = brk
        self.ops = ops

    def step(self):
        op = self.m[self.pc]
        f = self.ops.get(op)
        if f is None:
            raise RuntimeError(f'illegal opcode ${op:02X} at ${self.pc:04X}')
        self.pc = (self.pc + 1) & 0xffff
        f()
        self.cycles += 1
