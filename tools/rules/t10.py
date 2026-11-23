from h import *
import collections
g=open(ROOT+'/re/game_running.bin','rb').read()
def s16(lo,hi): v=lo|hi<<8; return v-65536 if v>32767 else v
VX=[s16(g[0x980+i],g[0x9a0+i]) for i in range(32)]; VY=[s16(g[0x880+i],g[0x8a0+i]) for i in range(32)]
c = start_game(extra=40)
m=c.cpu.m
st=freeze_ship(c)
c.writes_watch={0x7a0+i:[] for i in range(32)}
m[0xa3]=128; dirs=collections.Counter(); offs=collections.Counter(); life=collections.Counter()
gun=[o for o in objs(c) if o['type']<4][0]
for t in range(1500):
    for k in c.writes_watch: c.writes_watch[k].clear()
    tick(c, keys={'SPACE'}); freeze_ship(c, st)
    for k,v in c.writes_watch.items():
        if any(val==3 for f,pc,val in v):
            s=k-0x7a0
            vx=s16(m[0x6a0+s],m[0x6c0+s]); vy=s16(m[0x6e0+s],m[0x700+s])
            d=[i for i in range(32) if VX[i]==vx and VY[i]==vy]
            dirs[d[0] if d else (vx,vy)]+=1; life[m[0x720+s]&0x7f]+=1
print(gun, sorted(dirs.items()), life)
