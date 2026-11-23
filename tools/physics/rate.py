"""Measure main-loop rate (iterations per PAL frame) while the ship drifts at a forced velocity (forces scrolling)."""
from h import *
import sys
def run(vx, vy, n=300):
    c = boot(); m = c.cpu.m
    for f in range(80): c.run_frame()
    starts = []; busy = [0]; t = {'w': 0}
    def tr(pc):
        if pc == 0xB1AD:
            starts.append((c.cyc, t['w']))
            # force velocity (24-bit vx in 1/65536 X units, vy in 1/256 Y units)
            v = vx & 0xFFFFFF; m[0x12] = v & 255; m[0x13] = (v >> 8) & 255; m[0x14] = v >> 16
            v = vy & 0xFFFF; m[0x15] = v & 255; m[0x16] = v >> 8
        if pc in (0xB45A, 0xB45D): t['w'] += 4 if pc == 0xB45A else 3
    for f in range(n): c.run_frame(trace=tr)
    its = len(starts) - 1
    tot = starts[-1][0] - starts[0][0]; w = starts[-1][1] - starts[0][1]
    return its, tot / its, (tot - w) / its
for vx, vy in ((0, 1024), (0, 1536), (65536*2, 0), (65536*3, 0)):
    its, per, busy = run(vx, vy)
    print(f'vx={vx/65536:.2f} Xu/it vy={vy/256:.2f} Yu/it: {its} iters, {per:.0f} cycles/iter = {985248/per:.2f} Hz, busy {busy:.0f} cycles/iter ({busy/30273*100:.0f}% of budget)')
