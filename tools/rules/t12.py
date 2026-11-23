from h import *
c = start_game(extra=40)
m=c.cpu.m; m[0xa3]=0
st=freeze_ship(c)
for o in objs(c):
    if o['type'] in (0,4):
        inject_bullet(c,0,o['x']+1,o['y']+1)
        tick(c,2); freeze_ship(c,st)
        print(o['type'], 'state', m[0xa352+o['i']], 'score', m[0x182:0x17f:-1].hex())
# hitbox scan for gun: which (dx,dy) offsets register a hit
