"""Resume emulation from a RAM snapshot: runmem.py in.bin out.bin startpc maxsteps [stoppc] [dc01value]"""
import sys
from cpu6502 import CPU
cpu = CPU(bytearray(open(sys.argv[1], 'rb').read()))
cpu.pc = int(sys.argv[3], 16)
maxsteps = int(sys.argv[4])
stop = int(sys.argv[5], 16) if len(sys.argv) > 5 else -1
dc01 = int(sys.argv[6], 16) if len(sys.argv) > 6 else 0xff
cpu.sp = 0xf0
def rh(a):
    if not (0xd000 <= a < 0xe000) or (cpu.m[1] & 3) == 0 or not (cpu.m[1] & 4): return None
    r = (cpu.cycles // 20) % 312
    if a == 0xd012: return r & 0xff
    if a == 0xd011: return (cpu.m[a] & 0x7f) | (0x80 if r > 255 else 0)
    if a == 0xdc01: return dc01
    if a == 0xdc00: return 0xff
    return None
cpu.read_hook = rh
seen = set()
for n in range(maxsteps):
    pc = cpu.pc
    if pc == stop:
        print('stop at', hex(pc), 'step', n); break
    rom = (cpu.m[1] & 3) in (2, 3) and pc >= 0xe000 or (cpu.m[1] & 3) == 3 and 0xa000 <= pc < 0xc000
    if rom:
        print(f'ROM call ${pc:04X} step {n}')
        lo = cpu.pull(); hi = cpu.pull(); cpu.pc = ((hi << 8 | lo) + 1) & 0xffff
        continue
    if pc >> 8 not in seen:
        seen.add(pc >> 8); print(f'step {n}: page ${pc>>8:02X} pc=${pc:04X}')
    cpu.step()
print('final pc', hex(cpu.pc))
open(sys.argv[2], 'wb').write(bytes(cpu.m))
