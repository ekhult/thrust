from h import *
c = start_game(extra=40)
m=c.cpu.m
for t in range(10):
    tick(c); print(m[0x3d],m[0x6a],m[0xa3],m[0x44],hex(m[3]|m[4]<<8), m[0x19], m[0x63])
