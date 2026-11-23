"""Run the title-music player (JSR $2000 == JMP target of $3000) from the pristine mem_at_start state at 50 Hz and
dump the SID register file after every call -> re/data/music_sid_frames.json. Also reports loop point."""
import json, sys, os, hashlib
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))
from cpu6502 import CPU
ROOT = os.path.join(os.path.dirname(__file__), '..', '..')
m = bytearray(open(ROOT + '/re/mem_at_start.bin', 'rb').read())
cpu = CPU(m)
m[0x63] = 0xff     # title/attract mode -> music enabled
m[0xa2] = 0        # F1 'sound off' flag clear
def call(addr):
    cpu.sp = 0xf0; cpu.push(0xff); cpu.push(0xef); cpu.pc = addr
    while cpu.pc != 0xfff0: cpu.step()
N = int(sys.argv[1]) if len(sys.argv) > 1 else 20100
frames = []; loop = None; prevpos = (0, 0, 0)
for f in range(N):
    call(0x2000)
    frames.append(bytes(m[0xd400:0xd419]).hex())
    if f > 0 and loop is None and tuple(m[0x2452:0x2455]) == (0, 0, 0) and prevpos != (0, 0, 0):
        loop = f          # all three track-list positions wrapped ($FF) -> song restarts here
    prevpos = tuple(m[0x2452:0x2455])
print('song restarts at call', loop, '= %.1f s' % (loop / 50.125 if loop else 0))
json.dump({'description': 'SID registers $D400-$D418 (25 bytes, hex) after each call of the music play routine $2000 '
           '(called once per PAL frame, 50.125 Hz, from the raster IRQ via JSR $3000 = JMP $2000). '
           'Music only plays while $63!=0 (title/attract) and $A2==0. Starting state = mem_at_start.bin (song start).',
           'loop': loop, 'frames': frames}, open(ROOT + '/re/data/music_sid_frames.json', 'w'))
