import sys
sys.path.insert(0, '..')
from cpu6502 import CPU
m = bytearray(open('../../re/mem_at_start.bin', 'rb').read())
cpu = CPU(m); m[0x63]=0xff; m[0xa2]=0
def call(addr):
    cpu.sp=0xf0; cpu.push(0xff); cpu.push(0xef); cpu.pc=addr
    while cpu.pc!=0xfff0: cpu.step()
last=None; silent_since=None
for f in range(25000):
    call(0x2000)
    t=tuple(m[0x2452:0x2455])
    if t!=last and (f%2000==0 or f>19900 and f<20100): print(f,t)
    last=t
    g = m[0xd404]&1 or m[0xd40b]&1 or m[0xd412]&1
