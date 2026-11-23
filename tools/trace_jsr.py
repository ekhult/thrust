import sys, collections
from c64 import C64
ram = open('../extracted/mem4.bin','rb').read()
c = C64(ram); c.cpu.pc = 0x6c24; c.cpu.sp = 0xff
cnt = collections.Counter(); callers = collections.defaultdict(set)
m = c.cpu.m
phase = ['init']
def tr(pc):
    if m[pc] == 0x20:
        t = m[pc+1] | m[pc+2] << 8
        cnt[(phase[0], t)] += 1; callers[t].add(pc)
for f in range(700):
    c.keys = set()
    if 150 <= f <= 160: c.keys = {'SPACE'}
    if 400 <= f <= 520: c.keys = {'LSHIFT'}
    if 420 <= f <= 430: c.keys |= {'S'}
    if f % 20 == 0 and f > 300: c.keys |= {'RETURN'}
    if 520 < f < 600: c.keys |= {'SPACE'}
    phase[0] = 'menu' if f < 160 else 'game'
    c.run_frame(trace=tr)
for (ph, t), n in sorted(cnt.items(), key=lambda x: (x[0][0], x[0][1])):
    print(f'{ph:5} {t:04X} x{n:6d}  from ' + ' '.join(f'{p:04X}' for p in sorted(callers[t])[:8]))
open('../extracted/game_running.bin','wb').write(bytes(m))
