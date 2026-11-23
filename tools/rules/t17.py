from h import *
import sys
L=int(sys.argv[1]); sw=int(sys.argv[2])
c=goto_level(L); m=c.cpu.m; m[0xa3]=0
o=objs(c)[sw]; print(o)
st=move_to(c, o['x']-12, o['y']-10)
print('scroll', hex(m[3]|m[4]<<8), m[0x62], 'dead?', m[0x44])
shot(c,f'out/door{L}_before.png')
inject_bullet(c,0,o['x']+1,o['y']+1)
log=[]
for t in range(300):
    freeze_ship(c,st); tick(c); log.append((m[0x6b],m[0x6c]))
    if t in (5,20,40,250,280): shot(c,f'out/door{L}_{t}.png')
print(log[:30], log[230:300:5], 'state', m[0xa352+sw])
