from h import *
c = start_game(extra=50)
shot(c,'out/game_0.png')
open('out/game_start.ram','wb').write(bytes(c.cpu.m))
m=c.cpu.m
print('ship', [hex(m[a]) for a in range(7,0xd)], 'lvl', m[0xa4], m[0xa6a4])
