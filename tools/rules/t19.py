from h import *
import sys
c = start_game(extra=40)
m=c.cpu.m; m[0xa3]=0
m[0x180]=0x99; m[0x181]=0x09; m[0x182]=0
g=[o for o in objs(c) if o['type']==0][0]
lv=m[0x9403]; inject_bullet(c,0,g['x']+1,g['y']+1); tick(c,3)
print('lives before',lv,'after',m[0x9403],'score',m[0x182:0x17f:-1].hex(), flush=True)
for k in range(7):
    m[0x2a]=0xff; t0=c.frame; seen44=False
    for f in range(1500):
        c.run_frame()
        if m[0x44]!=0xff: seen44=True
        if m[0x63]!=0: break
        if seen44 and m[0x44]==0xff and m[0x19]>3: break
    print('death',k,'frames',c.frame-t0,'lives',m[0x9403],'$63',m[0x63],'seen',seen44, flush=True)
    if m[0x63]: break
