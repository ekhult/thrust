from h import *
def bcd(m): return int(f'{m[0x9401]:x}{m[0x9400]:02x}{m[0x93ff]:02x}')
c = boot(); m = c.cpu.m
for f in range(80): c.run_frame()
rows = []
it = Iter(c, lambda c: rows.append((c.frame, m[0x19], bcd(m), m[0x28], m[0x3C], m[0x33], m[0x30]<<8|m[0x2f], list(m[0x7e0:0x7e8]))))
for f in range(400):
    c.keys = {'SPACE'}; c.run_frame(trace=it.tr)
prev = None
for r in rows:
    if r[4] or (prev and prev[4]): print(r)
    prev = r
save_png(c.render(), '/private/tmp/claude-501/-Users-fredrik-nehr--claude-spares-spare-yPz7ib/612663e4-7f51-450a-8afb-d616c88f3a87/scratchpad/refuel.png')
