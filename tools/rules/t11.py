from h import *
c = start_game(extra=40)
m=c.cpu.m
print([ (k,hex(m[k])) for k in (8,9,0xa,0xb,0xc,0x32,0x33,0x2e,0x2f,0x30)])
fuel=[o for o in objs(c) if o['type']==4][0]; print(fuel)
st=bytearray(m[7:0xd]); st[2]=fuel['x']-3; y=fuel['y']-5; st[4]=y&255; st[5]=y>>8
m[0xa3]=0
for t in range(120):
    m[7:0xd]=st
    for a in (0x12,0x13,0x14,0x15,0x16): m[a]=0
    tick(c, keys={'SPACE'})
    f=m[0x9401]<<16|m[0x9400]<<8|m[0x93ff]
    if t%5==0 or m[0x3c]: print(t, 'x33',m[0x33],'y',hex(m[0x2f]|m[0x30]<<8),'3c',m[0x3c],'cnt',m[0x7e0+fuel['i']],'fuel %06x'%f,'state',m[0xa352+fuel['i']],'score',m[0x182:0x17f:-1].hex(), '27',m[0x27])
shot(c,'out/fuel.png')
