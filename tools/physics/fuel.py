from h import *
def bcd(m): return int(f'{m[0x9401]:x}{m[0x9400]:02x}{m[0x93ff]:02x}')
for mode in ('LSHIFT', 'SPACE', 'RSHIFT'):
    c = boot(); m = c.cpu.m
    for f in range(80): c.run_frame()            # into gameplay
    m[0x0d] = 16                                  # point down (no exit)
    rows = []
    it = Iter(c, lambda c: rows.append((c.frame, c.cpu.m[0x19], bcd(c.cpu.m), c.cpu.m[0x28], c.cpu.m[0x1a])))
    for f in range(400):
        c.keys = {mode}; c.run_frame(trace=it.tr)
    n = len(rows); used = rows[0][2] - rows[-1][2]
    print(mode, 'iters', n-1, 'frames', rows[-1][0]-rows[0][0], 'fuel used', used, 'per iter %.4f per sec %.2f' % (used/(n-1), used/(n-1)*985248/30270))
    if mode == 'SPACE':
        print(' shield $28 pattern first 24 iters:', ''.join(str(r[3]) for r in rows[:24]), ' $1A&2:', ''.join(str((r[4]>>1)&1) for r in rows[:24]))
        print(' fuel seq', [r[2] for r in rows[:16]])
