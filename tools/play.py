"""Run the game from $6C24 with a scripted key schedule, saving screenshots."""
import sys, pickle
from c64 import C64, save_png
ram = open('../extracted/mem4.bin','rb').read()
c = C64(ram)
c.cpu.pc = 0x6c24
c.cpu.sp = 0xff
script = eval(open(sys.argv[1]).read())  # list of (frame_from, frame_to, set_of_keys)
shots = set(eval(sys.argv[2]))
out = sys.argv[3]
last = max(max(shots), max(t for _, t, _ in script))
for f in range(last + 1):
    c.keys = set()
    for a, b, k in script:
        if a <= f <= b: c.keys |= set(k)
    c.run_frame()
    if f in shots:
        save_png(c.render(), f'{out}_{f:05d}.png')
        open(f'{out}_{f:05d}.ram', 'wb').write(bytes(c.cpu.m))
        print('shot', f, 'pc', hex(c.cpu.pc), flush=True)
