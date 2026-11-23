"""Start each level at each restart point in the real game (harness), then compare
(1) the multicolour bitmap playfield with the decoded terrain spans and (2) the object sprites
with the decoded object table. Usage: python3 verify_emu.py [outdir_for_screenshots]"""
import sys, os
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))
from c64 import C64, save_png
from decode import edges, spans, M
from objects import objects
ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..')
out = sys.argv[1] if len(sys.argv) > 1 else None

def restarts(lv):
    b = M[0xa8df+lv] | M[0xa8e5+lv] << 8; n = M[0xa873+lv]
    f = [[M[b+k*n+i] for i in range(n)] for k in range(6)]
    return [dict(Y=f[0][i]*256+f[1][i], s=f[2][i], T=f[3][i]*256+f[4][i], X=f[5][i]) for i in range(n)]

def start(lv, shipY, frames=110):
    ram = open(os.path.join(ROOT, 'extracted/mem4.bin'), 'rb').read()
    c = C64(ram); c.cpu.pc = 0x6c24; c.cpu.sp = 0xff
    m = c.cpu.m
    def tr(pc):
        if pc == 0xa6a7: m[0xa6a4] = lv
        if pc == 0xa5b9: m[0x0b] = shipY & 255; m[0x0c] = shipY >> 8
    f = 0
    while True:
        c.keys = {'SPACE'} if 150 <= f <= 152 else set()
        c.run_frame(trace=tr if f >= 145 else None)
        f += 1
        if f > 175 and m[0x0c] != 0: break
    for _ in range(frames): c.keys = set(); c.run_frame()
    # wait until the camera row T and scroll s are stable for 2 frames (sprites lag one frame)
    hist = []
    for _ in range(200):
        c.run_frame(); hist.append((m[3], m[4], m[0x62]))
        if len(hist) >= 3 and hist[-1] == hist[-2] == hist[-3]: break
    return c

allok = True
for lv in range(6):
    _, objs = objects(lv)
    for j, rp in enumerate(restarts(lv)):
        shipY = rp['Y'] + 2 if j < len(restarts(lv)) - 1 else 0xff00
        if j == 0: shipY = 0
        c = start(lv, shipY)
        m = c.cpu.m
        T = m[3] | m[4] << 8; s = m[0x62]
        SP = spans(lv, m[0x6c])
        bad = 0; checked = 0; other = 0
        for k in range(88):
            Y = T + 65 + k
            for odd in (0, 1):
                b = 18 + 2*k + odd
                if b >= 200: continue
                cr, ry = divmod(b, 8)
                for p in range(160):
                    byte = m[0x6000 + cr*320 + (p//4)*8 + ry]
                    v = (byte >> (6 - 2*(p % 4))) & 3
                    u = s + p//2
                    exp = 0 if (odd or SP[Y][0] <= u < SP[Y][1]) else 2
                    checked += 1
                    if v in (1, 3): other += 1; continue
                    if v != exp: bad += 1
        # sprites: gather (x,y,ptr) for sprites 0..5 per raster line
        seen = set()
        for rl in range(60, 260):
            st = c.linestate[rl]
            if not st: continue
            regs = st[0]
            for sp in range(6):
                if not (regs[0x15] >> sp) & 1: continue
                y = regs[1+2*sp]
                if y != rl - 1 and y != rl: continue
                x = regs[2*sp] | ((regs[0x10] >> sp) & 1) << 8
                seen.add((x, y))
        pred = []
        for o in objs:
            dy = o['y'] - T - 0x38
            dx = o['x'] - s + 5
            if 9 <= dy < 0x61 and 0 <= dx < 0x64:
                pred.append((4*dx + 4, 2*dy + 0x32, o['type']))
        miss = [p for p in pred if (p[0], p[1]) not in seen]
        # row buffer check ($0400 = L, $0500 = R, index = Y & 255) for all rows T..T+254, doors included
        bufbad = sum(1 for Y in range(T, min(T+255, len(SP))) if (m[0x400+(Y&255)], m[0x500+(Y&255)]) != SP[Y])
        # door test: shoot-switch equivalent ($6B=$FF), run until fully open, re-check buffer
        doorinfo = ''
        if lv >= 3:
            m[0x6b] = 0xff
            for _ in range(30): c.run_frame()
            SPo = spans(lv, m[0x6c]); T2 = m[3] | m[4] << 8
            dbad = sum(1 for Y in range(T2, min(T2+255, len(SPo))) if (m[0x400+(Y&255)], m[0x500+(Y&255)]) != SPo[Y])
            doorinfo = f' door-open($6C={m[0x6c]}) buffer mismatches {dbad}'
            bufbad += dbad
        ok = bad == 0 and not miss and bufbad == 0
        allok &= ok
        print(f'level {lv+1} restart {j}: T={T} s={s} ship=({m[9]},{m[0xb]|m[0xc]<<8}) terrain-pixel mismatches {bad}/{checked} (non-terrain %01/%11 px ignored: {other}); buffer mismatches {bufbad}{doorinfo}; objects in view {len(pred)} found {len(pred)-len(miss)} {"OK" if ok else "FAIL "+str(miss)+" seen "+str(sorted(seen))}')
        if out: save_png(c.render(), os.path.join(out, f'emu_l{lv+1}_r{j}.png'), scale=2)
print('ALL OK' if allok else 'SOME FAILED')
