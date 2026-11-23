import sys
from boot import *
lv = int(sys.argv[1]); fr = int(sys.argv[2])
c = boot(lv, fr)
save_png(c.render(), sys.argv[3])
m=c.cpu.m
print('ship', ['%02x'%m[i] for i in range(7,13)], 'A6A4', m[0xa6a4], '62', m[0x62], '84B3', m[0x84b3])
