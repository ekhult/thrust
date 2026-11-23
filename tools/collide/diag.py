"""Diagnose one probe in the original: log collisions and save a screenshot. diag.py level x y angle out.png"""
import sys
from probe_orig import *
from h import save_png
lv, x, y, ang = map(int, sys.argv[1:5])
c = goto_level(lv) if lv else start_game(extra=40)
m = c.cpu.m
for t in range(4000):
    cx, cy = m[9], m[0xb] | m[0xc] << 8
    if cx == x and cy == y: break
    cx += max(-2, min(2, x - cx)); cy += max(-3, min(3, y - cy))
    hold(m, cx, cy, ang, True); tick(c)
for t in range(25):
    hold(m, x, y, ang, True); tick(c)
print('cam', m[0x62], m[3] | m[4] << 8, 'sprite7 X,Y', m[0xd00e] | ((m[0xd010] >> 7) & 1) << 8, m[0xd00f], 'ptr', m[0x5c00 + 0x3f8 + 7], m[0x5400 + 0x3f8 + 7])
c.coll_log = []
c.d01e = c.d01f = 0; m[0xaf90] = 0; m[0x2a] = 0
for t in range(4):
    hold(m, x, y, ang, False); tick(c)
    if m[0x2a] or not m[0x44] & 0x80: break
print('dead' if (m[0x2a] or not m[0x44] & 0x80) else 'alive', c.coll_log[:12])
print('enabled', bin(m[0xd015]), [(s, m[0xd000+2*s] | ((m[0xd010]>>s)&1)<<8, m[0xd001+2*s]) for s in range(8)])
save_png(c.render(), sys.argv[5])
