"""Run the game's own stream code ($83B4 init + $840F forward / $83FE backward) on the CPU and
compare the $0400/$0500 row buffers with decode.edges()."""
import sys, os, random
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))
from cpu6502 import CPU
from decode import edges, M
def call(cpu, addr):
    cpu.sp = 0xf0; cpu.push(0xff); cpu.push(0xfe)  # return to $FFFF
    cpu.pc = addr
    n = 0
    while cpu.pc != 0xffff:
        cpu.step(); n += 1
        assert n < 5_000_000
ok = True
for lv in range(6):
    (L,_,_),(R,_,_) = edges(lv)
    cpu = CPU(bytearray(M))
    m = cpu.m
    m[0xa6a4] = lv
    # copy per-level stream pointers like $A6B8..$A6ED
    for dst, src in ((0x84c0,0xa8fd),(0x84c1,0xa903),(0x84c2,0xa909),(0x84c3,0xa90f),(0x84c4,0xa915),(0x84c5,0xa91b),(0x84c6,0xa921),(0x84c7,0xa927)):
        m[dst] = m[src+lv]
    T = 301
    m[3] = T & 255; m[4] = T >> 8
    call(cpu, 0x83b4)
    # emulate the scroll: move T randomly, calling forward/backward like $9014
    random.seed(lv)
    for step in range(3000):
        b3 = m[0x84b3]
        assert b3 == T & 255, (lv, T, b3)
        maxT = min(len(L), len(R)) - 512
        for k in range(256):
            row = T + 256 + k
            if row >= min(len(L), len(R)): continue
            if m[0x400 + (row & 255)] != L[row] or m[0x500 + (row & 255)] != R[row]:
                if k not in (255,):
                    print('MISMATCH lv', lv, 'T', T, 'row', row, m[0x400 + (row & 255)], L[row], m[0x500 + (row & 255)], R[row]); ok = False; break
        d = random.choice([1,1,1,-1]) if T > 300 else 1
        if T + d > maxT: d = -1
        if d > 0: call(cpu, 0x840f); T += 1
        else: call(cpu, 0x83fe); T -= 1
        m[3] = T & 255; m[4] = T >> 8
        if not ok: break
    print('level', lv, 'final T', T, 'ok' if ok else 'FAIL')
