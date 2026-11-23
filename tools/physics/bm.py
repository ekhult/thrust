from h import *
c = boot(); m = c.cpu.m
for f in range(100): c.run_frame()
import collections
cnt = collections.Counter(); colmap = collections.Counter()
regs, dd = c.linestate[200]
scr = 0x4000 + ((regs[0x18] >> 4) & 15) * 0x400
bmp = 0x4000 + (0x2000 if regs[0x18] & 8 else 0)
print('scr %04x bmp %04x' % (scr, bmp))
for row in range(5, 25):
    for col in range(40):
        for ry in range(8):
            b = m[bmp + (row*40+col)*8 + ry]
            for p in range(4):
                v = (b >> (6-2*p)) & 3
                if v:
                    code = m[scr+row*40+col]; cr = m[0xd800+row*40+col] & 15
                    colour = [None, code >> 4, code & 15, cr][v]
                    cnt[v] += 1; colmap[(v, colour)] += 1
print(cnt); print(colmap.most_common(12))
