from h import *
for L in (3,4,5):
    c=goto_level(L); m=c.cpu.m
    print('level',L, 'ship', hex(m[9]), hex(m[0xb]|m[0xc]<<8), 'scroll', hex(m[3]|m[4]<<8), m[0x62])
    for o in objs(c): print('  ',o)
    shot(c,f'out/level{L}.png')
