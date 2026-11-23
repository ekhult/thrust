from h import *
import sys
seed = int(sys.argv[1]) if len(sys.argv)>1 else 0
c = start_game(extra=40 + seed)
m=c.cpu.m
m[0xa3]=0
r=[o for o in objs(c) if o['type']==6][0]
print(r, 'A3', m[0xa3])
hits=0; log=[]
for t in range(2000):
    if t%6==0 and m[0x6a]==0xff:
        inject_bullet(c, 0, r['x']+2, r['y']+3)
    prev=(m[0x3e],m[0x3d],m[0x6a])
    tick(c)
    cur=(m[0x3e],m[0x3d],m[0x6a])
    if cur[0]!=prev[0] or (cur[2]!=prev[2]):
        hits+=1; log.append((t,cur, m[0x69]))
    if m[0x6a]==0: break
for l in log: print(l)
print('hits until critical', sum(1 for l in log if l[1][2]==0xff)+1)
