"""Run the crunched PRG in the 6502 emulator; stub KERNAL calls with RTS; stop at a target PC."""
import sys
from cpu6502 import CPU
prg = open(sys.argv[1], 'rb').read()
stop = int(sys.argv[3], 16) if len(sys.argv) > 3 else None
cpu = CPU()
load = prg[0] | prg[1] << 8
cpu.m[load:load + len(prg) - 2] = prg[2:]
cpu.m[1] = 0x37
cpu.pc = 2059
seen = set()
raster = [0]
def rh(a):
    if not (0xd000 <= a < 0xe000) or (cpu.m[1] & 3) == 0 or not (cpu.m[1] & 4): return None
    raster[0] = (cpu.cycles // 20) % 312
    if a == 0xd012:
        return raster[0] & 0xff
    if a == 0xd011:
        return (cpu.m[a] & 0x7f) | (0x80 if raster[0] > 255 else 0)
    if a in (0xdc00, 0xdc01): return 0xff
    return None
cpu.read_hook = rh
for n in range(int(sys.argv[4]) if len(sys.argv) > 4 else 20_000_000):
    pc = cpu.pc
    if pc == stop:
        print('reached stop', hex(pc), 'after', n); break
    rom = (cpu.m[1] & 3) in (2, 3) and pc >= 0xe000 or (cpu.m[1] & 3) == 3 and 0xa000 <= pc < 0xc000
    if rom:
        print(f'ROM call ${pc:04X} A={cpu.a:02X} X={cpu.x:02X} Y={cpu.y:02X} step {n}')
        if pc in (0xffe4, 0xf13e):  # GETIN -> no key
            cpu.a = 0
        lo = cpu.pull(); hi = cpu.pull(); cpu.pc = ((hi << 8 | lo) + 1) & 0xffff
        continue
    if pc == 0x2c1b: cpu.pc = 0x2c22; continue
    page = pc >> 8
    if page not in seen:
        seen.add(page)
        print(f'step {n}: first exec in page ${page:02X}xx (pc=${pc:04X})')
    cpu.step()
open(sys.argv[2], 'wb').write(bytes(cpu.m))
print('final pc', hex(cpu.pc))
