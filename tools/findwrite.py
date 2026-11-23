import sys
from cpu6502 import CPU
cpu = CPU(bytearray(open(sys.argv[1],'rb').read()))
cpu.pc = int(sys.argv[2],16); maxs=int(sys.argv[3]); lo,hi=int(sys.argv[4],16),int(sys.argv[5],16)
dc01 = int(sys.argv[6],16) if len(sys.argv)>6 else 0xff
cpu.sp=0xf0
def rh(a):
    r=(cpu.cycles//20)%312
    if a==0xd012: return r&0xff
    if a==0xd011: return (cpu.m[a]&0x7f)|(0x80 if r>255 else 0)
    if a==0xdc01: return dc01
    if a==0xdc00: return 0xff
def wh(a,v):
    if lo<=a<=hi: print(f'write ${a:04X}={v:02X} pc=${cpu.pc:04X} step {n}')
cpu.read_hook=rh; cpu.write_hook=wh
for n in range(maxs):
    pc=cpu.pc
    if pc == 0x2c1b: cpu.pc = 0x2c22; continue
    rom=(cpu.m[1]&3) in (2,3) and pc>=0xe000 or (cpu.m[1]&3)==3 and 0xa000<=pc<0xc000
    if rom:
        lo_=cpu.pull(); hi_=cpu.pull(); cpu.pc=((hi_<<8|lo_)+1)&0xffff; continue
    cpu.step()
