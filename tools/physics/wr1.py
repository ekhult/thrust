from h import *
c = boot()
w = WriteLog(c, 0x00, 0xff)
for f in range(400):
    c.keys = set()
    if f < 120: c.keys.add('LSHIFT')
    if 30 < f < 60: c.keys.add('A')
    if 150 < f < 300: c.keys.add('SPACE')
    if f % 10 == 0: c.keys.add('RETURN')
    c.run_frame(trace=w.tr)
by = collections.defaultdict(list)
for (a, pc), n in w.log.items(): by[a].append((pc, n))
for a in sorted(by):
    print(f'${a:02X}: ' + ' '.join(f'{pc:04X}x{n}' for pc, n in sorted(by[a])))
