from h import *
c = boot()
starts = []; wait = collections.Counter(); hot = collections.Counter()
cur = [None]
def tr(pc):
    if pc == 0xB1AD: starts.append(c.cyc)
    hot[pc] += 1
for f in range(300):
    c.keys = {'LSHIFT'} if f < 60 else set()
    c.run_frame(trace=tr)
d = [b - a for a, b in zip(starts, starts[1:])]
print(len(starts), 'iters; cycles/iter', d[:40])
print('avg', sum(d)/len(d), 'frames/iter', sum(d)/len(d)/19656)
for pc, n in hot.most_common(25): print(f'{pc:04X} {n}')
