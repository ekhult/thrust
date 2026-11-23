"""Run the real game with random inputs and compare the model iteration by iteration."""
import random, sys
from h import *
from model import Ship, s24, s16
seed = int(sys.argv[1]) if len(sys.argv) > 1 else 1
podmode = len(sys.argv) > 2 and sys.argv[2] == 'pod'
TP = float(sys.argv[3]) if len(sys.argv) > 3 else 0.2
KILL = int(sys.argv[4]) if len(sys.argv) > 4 else -1
KILLV = int(sys.argv[5], 16) if len(sys.argv) > 5 else 0x80
random.seed(seed)
c = boot(); m = c.cpu.m
fl = {'rot': 0, 'thr': False}
snaps = []
def tr(pc):
    if pc == 0xB1AD:
        snaps.append((dict(fl), read(m))); fl['rot'] = 0; fl['thr'] = False
    elif pc == 0x9E16: fl['rot'] -= 1
    elif pc == 0x9E1F: fl['rot'] += 1
    elif pc == 0x95E0: fl['thr'] = True
def read(m):
    return dict(x=m[9]<<16|m[8]<<8|m[7], y=m[0xc]<<16|m[0xb]<<8|m[0xa], vx=s24(m[0x14]<<16|m[0x13]<<8|m[0x12]),
                vy=s16(m[0x16]<<8|m[0x15]), ang=m[0xd], rod=m[0x1d]<<16|m[0x1c]<<8|m[0x1b],
                av=s24(m[0x20]<<16|m[0x1f]<<8|m[0x1e]), it=m[0x19], p22=m[0x22], p44=m[0x44], p42=m[0x42],
                grav=s16(m[0xa6]<<8|m[0xa7]), p57=m[0x57], p54=m[0x54])
keys = set(); f = 0
# fly upward-ish randomly, keep away from terrain: thrust when moving down
while len(snaps) < 600 and f < 1500:
    if f % 6 == 0:
        keys = set()
        r = random.random()
        if r < 0.3: keys.add('A')
        elif r < 0.6: keys.add('S')
        st_ = read(m)
        # crude autopilot: thrust if falling and pointing up-ish
        if (st_['vy'] > -20 and st_['ang'] in (30, 31, 0, 1, 2)) or random.random() < TP: keys.add('LSHIFT')
        if st_['ang'] not in (29,30,31,0,1,2,3) and random.random()<0.7:
            keys.discard('A'); keys.discard('S'); keys.add('A' if st_['ang'] >= 16 else 'S')
    c.keys = keys
    if podmode and f == 30:
        m[0x22] = 0xFF
    if f == KILL: m[0xd01f] = KILLV
    c.run_frame(trace=tr); f += 1
print('iterations', len(snaps))
# model
S = None; bad = 0; first = None
for i in range(1, len(snaps)):
    flags, st0 = snaps[i-1][0], snaps[i-1][1]
    flags = snaps[i][0]   # flags gathered during iteration i-1
    st1 = snaps[i][1]
    if S is None or resync:
        S = Ship()
        for k in ('x','y','vx','vy','ang','rod','av','it','p22','p44','p42','grav'): setattr(S, k, st0[k])
        S.vx = st0['vx']; S.fuel_ok = st0['p57'] == 0; S.rodlen = st0['p54']
    resync = False
    S.p22, S.p44, S.p42 = st0['p22'], st0['p44'], st0['p42']   # flags driven by game logic
    S.step(flags['rot'], flags['thr'])
    mine = dict(x=S.x, y=S.y, vx=S.vx, vy=S.vy, ang=S.ang, rod=S.rod, av=S.av)
    diff = {k: (mine[k], st1[k]) for k in mine if mine[k] != st1[k]}
    if diff:
        bad += 1
        if bad < 6: print('iter', i, 'it', st0['it'], 'p44', st0['p44'], 'p22', st0['p22'], diff)
        resync = True
print('mismatching iterations:', bad, 'last state', snaps[-1][1])
import collections
print('p44 values', collections.Counter(s[1]['p44'] for s in snaps).most_common(5))
print('thrust iters', sum(1 for s in snaps if s[0]['thr']), 'rot iters', sum(1 for s in snaps if s[0]['rot']))
print('max |vx|', max(abs(s[1]['vx']) for s in snaps), 'max|vy|', max(abs(s[1]['vy']) for s in snaps), 'max|av|', max(abs(s[1]['av']) for s in snaps))
