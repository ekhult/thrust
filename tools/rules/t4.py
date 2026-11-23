from h import *
c = start_game(extra=20)
m=c.cpu.m
w=lambda a: m[a]|m[a+1]<<8
px,py,ph,pt,pf = w(0x880d),w(0x8812),w(0x8817),w(0x8584),w(0x858d)
print(hex(px),hex(py),hex(ph),hex(pt),hex(pf))
i=0
while m[pt+i]!=0xff:
    print(i,'type',m[pt+i],'flags',hex(m[pf+i]),'x',m[px+i],'y',hex(m[py+i]|m[ph+i]<<8),'state',m[0xa352+i])
    i+=1
print('scroll',hex(m[3]|m[4]<<8),'x62',m[0x62],'ship',hex(m[9]),hex(m[0xb]|m[0xc]<<8))
