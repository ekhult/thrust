import sys, os
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))
from c64 import C64, save_png
ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..')
def boot(level=None, frames=200, poke=None):
    ram = open(os.path.join(ROOT, 'extracted/mem4.bin'), 'rb').read()
    c = C64(ram); c.cpu.pc = 0x6c24; c.cpu.sp = 0xff
    for f in range(frames):
        c.keys = {'SPACE'} if 150 <= f <= 152 else set()
        if level is not None and f == 149:
            c.cpu.m[0xa6a4] = level
        if poke and f == 149: poke(c)
        c.run_frame()
    return c
