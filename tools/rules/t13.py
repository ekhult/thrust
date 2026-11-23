from h import *
import sys
mode = sys.argv[1]
c = start_game(extra=40)
m=c.cpu.m; m[0xa3]=0
if mode=='crit':
    r=[o for o in objs(c) if o['type']==6][0]
    t=0
    while m[0x6a]==0xff:
        if t%6==0: inject_bullet(c,0,r['x']+2,r['y']+3)
        tick(c); t+=1
if mode=='crit_pod':
    r=[o for o in objs(c) if o['type']==6][0]
    t=0
    while m[0x6a]==0xff:
        if t%6==0: inject_bullet(c,0,r['x']+2,r['y']+3)
        tick(c); t+=1
    m[0x22]=0xff
if mode=='pod': m[0x22]=0xff
st=bytearray(m[7:0xd]); st[4]=0x10; st[5]=1
m[7:0xd]=st
log=[]
for f in range(900):
    c.run_frame()
    log.append((f,m[0x19],m[0xa4],m[0xa6a4],m[0xb681],m[0x182:0x17f:-1].hex(),m[0x9403]))
    if f%25==0: shot(c,f'out/leave_{mode}_{f:03d}.png')
    if m[0xa4]==1 and m[0x19]>30: break
for l in log[::25]: print(l)
print(log[-1])
