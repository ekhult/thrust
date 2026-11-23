from h import *
import sys
c = boot()
rows = []
it = Iter(c, lambda c: rows.append((c.frame, st(c))))
keys = eval(sys.argv[1]) if len(sys.argv) > 1 else (lambda i: set())
N = int(sys.argv[2]) if len(sys.argv) > 2 else 150
for f in range(N):
    c.keys = keys(it.n)
    c.run_frame(trace=it.tr)
for fr, r in rows: print(fr, r)
save_png(c.render(), '/tmp/claude-501/fall.png') if False else None
