"""Probe the ORIGINAL game: for each (level, x, y, angle) place the ship (centre position, no pod) and report
whether the hardware collision logic kills it.  Usage: probe_orig.py probes.txt out.txt
Transit to each point happens with the collision grace counter ($AF90) held, guns silenced ($3D) and fuel topped up."""
import sys, os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'rules'))
from h import start_game, goto_level, tick

ROD = None   # rod angle (0..31) when probing with the pod attached

def hold(m, x, y, ang, grace):
    if ROD is not None:
        m[0x22] = 0xff; m[0xb520] = 0xff; m[0xa6a6] = 0xff; m[0x54] = 14
        m[0x1b] = 0; m[0x1c] = 0; m[0x1d] = ROD
        m[0x1e] = m[0x1f] = m[0x20] = 0
        m[0x2b] = 0 if grace else m[0x2b]
    m[9] = x; m[0xb] = y & 255; m[0xc] = y >> 8; m[7] = m[8] = m[0xa] = 0
    for a in (0x12, 0x13, 0x14, 0x15, 0x16): m[a] = 0
    m[0x0d] = ang
    m[0x3d] = 0xff            # guns + smoke off
    m[0x9400] = 0x50          # fuel
    if grace: m[0xaf90] = 10; m[0x2a] = 0

CPU_FIELDS = ('a', 'x', 'y', 'sp', 'pc', 'c', 'z', 'i', 'd', 'v', 'n', 'cycles')
C64_FIELDS = ('cyc', 'line', 'raster_cmp', 'd019', 'd01a', 'dd00', 'pa', 'timer_latch', 'timer', 'timer_on',
              'cia_icr_mask', 'cia_icr', 'frame', 'd01e', 'd01f')

def snapshot(c):
    return (bytes(c.cpu.m), {f: getattr(c.cpu, f) for f in CPU_FIELDS}, {f: getattr(c, f) for f in C64_FIELDS})

def restore(c, s):
    c.cpu.m[:] = s[0]
    for k, v in s[1].items(): setattr(c.cpu, k, v)
    for k, v in s[2].items(): setattr(c, k, v)

def probe(c, x, y, ang):
    m = c.cpu.m
    # walk there (camera follows) with collisions suppressed
    for t in range(4000):
        cx, cy = m[9], m[0xb] | m[0xc] << 8
        if cx == x and cy == y: break
        cx += max(-2, min(2, x - cx)); cy += max(-3, min(3, y - cy))
        hold(m, cx, cy, ang, True); tick(c)
    for t in range(800):                      # let the camera settle (it scrolls 1 row/tick at rest)
        hold(m, x, y, ang, True); tick(c)
        if t > 8 and m[0x05] == 0 and m[0x06] == 0: break
    snap = snapshot(c)
    cam = (m[0x62], m[0x03] | m[0x04] << 8)
    c.d01e = c.d01f = 0
    m[0xaf90] = 0; m[0x2a] = 0; m[0x2b] = 0
    c.coll_log = []
    hit = 0
    for t in range(4):
        hold(m, x, y, ang, False); tick(c)
        if m[0x2a] or m[0x2b] or not m[0x44] & 0x80:
            hit = 1; break
    log = sorted(set((k, a, b) for k, r, a, b in c.coll_log))
    c.coll_log = None
    restore(c, snap)
    return (hit,) + cam + (log,)

if __name__ == '__main__':
    probes = [tuple(map(int, l.split())) for l in open(sys.argv[1]) if l.strip()]
    pod_mode = len(probes[0]) == 5
    out = open(sys.argv[2], 'w')
    cur = None; c = None
    for p in probes:
        lv, x, y, ang = p[:4]
        ROD = p[4] if pod_mode else None
        if lv != cur:
            c = goto_level(lv) if lv else start_game(extra=40)
            cur = lv
        m = c.cpu.m
        hit, camx, camrow, log = probe(c, x, y, ang)
        rod = f' {ROD}' if pod_mode else ''
        out.write(f'{lv} {x} {y} {ang}{rod} {hit} {camx} {camrow} # {log}\n'); out.flush()
