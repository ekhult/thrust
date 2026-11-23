from h import *
c = start_game(extra=40)
m=c.cpu.m
m[0xa3]=0
r=[o for o in objs(c) if o['type']==6][0]
t=0
while m[0x6a]==0xff:
    if t%6==0: inject_bullet(c, 0, r['x']+2, r['y']+3)
    tick(c); t+=1
tick(c,40); shot(c,'out/countdown.png')
while m[0x6a]!=0: tick(c)
seq=[]
for i in range(150):
    tick(c); seq.append((m[0x44],m[0x43],m[0x2a],m[0x02],m[0x6a], m[0x9403]))
    if i in (2,10,30,60): shot(c,f'out/boom_{i}.png')
print(seq)
for i in range(400):
    tick(c)
    if i%50==0: shot(c,f'out/after_{i}.png'); print(i, m[0xa4], m[0xa6a4], hex(m[0x9403]), m[0xb681], m[0x6a], m[0xa3])
