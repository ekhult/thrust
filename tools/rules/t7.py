from h import *
import collections
c = start_game(extra=40)
m=c.cpu.m
c.writes_watch={0x7a0+i:[] for i in range(32)}
st=freeze_ship(c)
for A3 in (1,9,35,128):
    for k in c.writes_watch: c.writes_watch[k].clear()
    m[0xa3]=A3; T=3000; deaths=0
    for t in range(T):
        tick(c, keys={'SPACE'}); freeze_ship(c, st)
        if m[0x44]!=0xff: deaths+=1
    ev=[(f,pc) for k,v in c.writes_watch.items() for (f,pc,val) in v if val==3]
    print('A3',A3,'shots',len(ev),'per tick %.4f'%(len(ev)/T),'expected %.4f'%(A3/256),'deathticks',deaths, set(hex(p) for f,p in ev))
