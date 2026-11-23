"""Shared helpers for physics experiments. Run from tools/physics."""
import sys, os, collections
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, '..'))
from c64 import C64, save_png
RE = os.path.join(HERE, '..', '..', 're')

def boot(start_frames=175):
    ram = open(os.path.join(RE, 'mem_at_start.bin'), 'rb').read()
    c = C64(ram); c.cpu.pc = 0x6c24; c.cpu.sp = 0xff
    for f in range(start_frames):
        c.keys = {'SPACE'} if 150 <= f <= 160 else set()
        c.run_frame()
    return c

class WriteLog:
    """record writes with instruction PC"""
    def __init__(self, c, lo, hi):
        self.c = c; self.lo = lo; self.hi = hi; self.log = collections.Counter(); self.ipc = 0
        orig = c.cpu.write_hook
        def wh(a, v):
            if lo <= a <= hi: self.log[(a, self.ipc)] += 1
            return orig(a, v)
        c.cpu.write_hook = wh
    def tr(self, pc): self.ipc = pc

def zp(c, *addrs): return [c.cpu.m[a] for a in addrs]

def st(c):
    m = c.cpu.m
    s = lambda v: v - 256 if v >= 128 else v
    return dict(it=m[0x19], ang=m[0x0d],
        x=(m[9] << 16 | m[8] << 8 | m[7]) / 65536.0, y=((m[0xc] << 16 | m[0xb] << 8 | m[0xa])) / 256.0,
        vx=(s(m[0x14]) * 65536 + (m[0x13] << 8 | m[0x12])) / 65536.0,
        vy=(s(m[0x16]) * 256 + m[0x15]) / 256.0,
        rod=(m[0x1d] << 16 | m[0x1c] << 8 | m[0x1b]) / 65536.0,
        av=(s(m[0x20]) * 65536 + (m[0x1f] << 8 | m[0x1e])) / 65536.0,
        p22=m[0x22], p44=m[0x44], p42=m[0x42], p45=m[0x45], p27=m[0x27], p28=m[0x28],
        fuel=f'{m[0x9401]:x}{m[0x9400]:02x}{m[0x93ff]:02x}', p54=m[0x54], p57=m[0x57])

class Iter:
    """call fn(c) at each main loop iteration start ($B1AD)"""
    def __init__(self, c, fn, pc=0xB1AD):
        self.c = c; self.fn = fn; self.pc = pc; self.n = 0
    def tr(self, pc):
        if pc == self.pc:
            self.n += 1; self.fn(self.c)
