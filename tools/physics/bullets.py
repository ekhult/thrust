from h import *
import sys
ang = int(sys.argv[1]) if len(sys.argv) > 1 else 8
c = boot(); m = c.cpu.m
for f in range(80): c.run_frame()
m[0x0d] = ang
rows = []
def snap(c):
    sl = []
    for x in range(4):
        sl.append((m[0x620+x] + m[0x600+x]/256, (m[0x680+x]<<8|m[0x660+x]) + m[0x640+x]/256,
                   ((m[0x6c0+x]^0x80)-0x80) + m[0x6a0+x]/256, ((m[0x700+x]^0x80)-0x80) + m[0x6e0+x]/256, m[0x720+x] & 0x7f, m[0x7a0+x]))
    rows.append((c.frame, m[0x19], m[0x33] + m[0x32]/256, (m[0x30]<<8|m[0x2f]) + m[0x2e]/256, m[0x2d], m[0x2c], sl))
it = Iter(c, snap)
for f in range(160):
    c.keys = set()
    if f < 20: c.keys = {'RETURN'}            # held: should fire only once
    if 30 <= f < 32 or 34 <= f < 36 or 38 <= f < 40 or 42 <= f < 44 or 46 <= f < 48: c.keys = {'RETURN'}
    m[0x0d] = ang
    c.run_frame(trace=it.tr)
for r in rows[:70]:
    print(r[0], r[1], 'ship', r[2], r[3], 'slot', r[4], '2C', r[5], ' '.join('(%.2f,%.2f v%.2f,%.2f L%d t%d)' % s for s in r[6]))
