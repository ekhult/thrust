import sys, os
sys.path.insert(0, '..')
from cpu6502 import CPU
m = bytearray(open('../../re/mem_at_start.bin', 'rb').read())
cpu = CPU(m); m[0x63]=0xff; m[0xa2]=0
def call(addr):
    cpu.sp=0xf0; cpu.push(0xff); cpu.push(0xef); cpu.pc=addr
    while cpu.pc!=0xfff0: cpu.step()
for v in range(3):
    p = m[0x2565+v] | m[0x2568+v]<<8
    t=[]; i=0
    while m[p+i] not in (0xff,0xfe): t.append(m[p+i]); i+=1
    print('voice',v,'track @%04X'%p, t, 'end', hex(m[p+i]))
print('speed $246C', m[0x246c], 'npatterns ptr tables $256B/$2592')
prev=[0,0,0]; wraps=[]
for f in range(20000):
    call(0x2000)
    cur=list(m[0x2452:0x2455])
    for v in range(3):
        if cur[v] < prev[v]: wraps.append((f,v))
    prev=cur
print(wraps[:12])
