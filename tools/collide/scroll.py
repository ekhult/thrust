import sys
sys.path.insert(0, '../rules')
from h import start_game, tick
c = start_game(extra=40)
for t in range(5):
    tick(c)
    vals = {}
    for r in range(40, 260):
        st = c.linestate[r]
        if st: vals.setdefault((st[0][0x11] & 0x7f, st[0][0x16], st[0][0x18]), []).append(r)
    print({ (hex(a), hex(b), hex(d)): (v[0], v[-1]) for (a, b, d), v in vals.items()})
