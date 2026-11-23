from h import *
c = boot(); m = c.cpu.m
for f in range(80): c.run_frame()
m[0x93ff] = 0x03; m[0x9400] = 0; m[0x9401] = 0
rows = []
it = Iter(c, lambda c: rows.append((m[0x19], '%x%02x%02x' % (m[0x9401], m[0x9400], m[0x93ff]), m[0x57], m[0x9402], (m[0x16]^0x80)-0x80+m[0x15]/256, m[0x28])))
for f in range(60):
    c.keys = {'LSHIFT'} if f < 40 else {'SPACE'}
    c.run_frame(trace=it.tr)
for r in rows: print(r)
