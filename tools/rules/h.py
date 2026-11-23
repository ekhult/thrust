"""Shared helpers for rules RE experiments."""
import sys, os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))
from c64 import C64, save_png
from dis import dis
ROOT = os.path.join(os.path.dirname(__file__), '..', '..')
def boot(frames=0):
    ram = open(os.path.join(ROOT, 're/mem_at_start.bin'), 'rb').read()
    c = C64(ram); c.cpu.pc = 0x6c24; c.cpu.sp = 0xff
    for f in range(frames): c.run_frame()
    return c
def start_game(c=None, extra=10):
    c = c or boot()
    for f in range(150): c.run_frame()
    c.keys = {'SPACE'}
    for f in range(10): c.run_frame()
    c.keys = set()
    for f in range(extra): c.run_frame()
    return c
def shot(c, path): save_png(c.render(), path)
def run(c, n, keys=()):
    c.keys = set(keys)
    for _ in range(n): c.run_frame()
    c.keys = set()
def tick(c, n=1, keys=None):
    """run until main-loop counter $19 has advanced n times"""
    m = c.cpu.m
    if keys is not None: c.keys = set(keys)
    for _ in range(n):
        s = m[0x19]; k = 0
        while m[0x19] == s and k < 20:
            c.run_frame(); k += 1
def objs(c):
    m = c.cpu.m; w = lambda a: m[a] | m[a+1] << 8
    px, py, ph, pt, pf = w(0x880d), w(0x8812), w(0x8817), w(0x8584), w(0x858d)
    r = []; i = 0
    while m[pt+i] != 0xff:
        r.append(dict(i=i, type=m[pt+i], flags=m[pf+i], x=m[px+i], y=m[py+i] | m[ph+i] << 8, state=m[0xa352+i])); i += 1
    return r
def inject_bullet(c, slot, x, y, vx=0, vy=0, life=0x28, owner=0):
    m = c.cpu.m
    m[0x0600+slot] = 0; m[0x0620+slot] = x & 255
    m[0x0640+slot] = 0; m[0x0660+slot] = y & 255; m[0x0680+slot] = y >> 8
    m[0x06a0+slot] = vx & 255; m[0x06c0+slot] = (vx >> 8) & 255
    m[0x06e0+slot] = vy & 255; m[0x0700+slot] = (vy >> 8) & 255
    m[0x0720+slot] = (m[0x0720+slot] & 0x80) | life; m[0x07a0+slot] = owner
def freeze_ship(c, st=None):
    """keep ship hovering at saved position (state from first call), refill fuel."""
    m = c.cpu.m
    if st is None: st = bytes(m[0x07:0x0d])
    m[0x07:0x0d] = st
    for a in (0x12, 0x13, 0x14, 0x15, 0x16): m[a] = 0
    m[0x9400] = 0x50
    return st
def goto_level(idx, c=None):
    """start a game and warp to level index idx (0..5) via a pod-exit transition"""
    c = c or start_game(extra=40)
    m = c.cpu.m
    if idx == 0: return c
    m[0xa6a4] = idx - 1; m[0xa4] = idx - 1; m[0xb681] = idx
    m[0x22] = 0xff
    st = bytearray(m[7:0xd]); st[4] = 0x10; st[5] = 1; m[7:0xd] = st
    for f in range(700):
        c.run_frame()
        if m[0xa6a4] == idx and m[0x19] > 5: break
    return c
def move_to(c, x, y, settle=120, step=1):
    """walk the ship (and thereby the scroll) to world x (byte $09), y (16-bit $0B/$0C)."""
    m = c.cpu.m
    for t in range(3000):
        cx, cy = m[9], m[0xb] | m[0xc] << 8
        if cx == x and cy == y: break
        cx += max(-1, min(1, x - cx)); cy += max(-step, min(step, y - cy))
        m[9] = cx; m[0xb] = cy & 255; m[0xc] = cy >> 8; m[7] = m[8] = m[0xa] = 0
        for a in (0x12, 0x13, 0x14, 0x15, 0x16): m[a] = 0
        m[0x9400] = 0x50; tick(c)
    st = bytes(m[7:0xd])
    for t in range(settle):
        freeze_ship(c, st); tick(c)
    return st
