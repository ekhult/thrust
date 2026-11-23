# measure busy cycles per main-loop iteration (excluding wait loop at $B45A) and IRQ share
from h import *
c = boot()
starts=[]; waitc=[0]; last=[None]; inirq=[0]
def tr(pc):
    if pc == 0xB1AD: starts.append((c.cyc, waitc[0]))
    if pc in (0xB45A, 0xB45D):
        waitc[0] += 6 if pc==0xB45A else 2   # lda abs 4 + bpl 3 approx
for f in range(600):
    c.keys = set()
    if f < 400: c.keys = {'LSHIFT'} if (f//40)%2 else {'A'}
    if f % 7 == 0: c.keys.add('RETURN')
    c.run_frame(trace=tr)
busy = [ (b[0]-a[0]) - (b[1]-a[1]) for a,b in zip(starts, starts[1:])]
tot = [ (b[0]-a[0]) for a,b in zip(starts, starts[1:])]
print('iters',len(busy),'busy min/avg/max', min(busy), sum(busy)//len(busy), max(busy))
print('total avg', sum(tot)/len(tot), 'Hz', 985248/(sum(tot)/len(tot)))
