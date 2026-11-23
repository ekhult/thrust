"""Original game in the harness with VIC collision emulation: does the falling ship die by itself?"""
import sys, os, time
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'rules'))
from h import start_game, tick
t = time.time()
c = start_game(extra=5)
m = c.cpu.m
for i in range(200):
    tick(c)
    if not m[0x44] & 0x80:
        print('died at tick', i, 'centre x', m[9], 'y', m[0xb] | m[0xc] << 8, '$2A', m[0x2a]); break
else:
    print('no death; y', m[0xb] | m[0xc] << 8)
print('%.1fs' % (time.time() - t))
