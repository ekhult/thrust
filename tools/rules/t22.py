from h import *
c = start_game(extra=40); m=c.cpu.m; m[0xa3]=0
m[0x93ff]=0x05; m[0x9400]=0
f0=lambda: '%02x%02x%02x'%(m[0x9401],m[0x9400],m[0x93ff])
used=[]
for t in range(40):
    tick(c, keys={'LSHIFT'}); used.append(f0())
print(used, 'flag9402', m[0x9402], '$57', m[0x57])
# fuel use rate measurement: thrust for 160 ticks
c2 = start_game(extra=40); m2=c2.cpu.m; m2[0xa3]=0
st=freeze_ship(c2); a=m2[0x9400]*100+ (m2[0x93ff]>>4)*10+(m2[0x93ff]&15)
for t in range(160):
    c2.keys={'LSHIFT'}; tick(c2); m2[7:0xd]=st
    for k in (0x12,0x13,0x14,0x15,0x16): m2[k]=0
def val(m): return int('%02x%02x%02x'%(m[0x9401],m[0x9400],m[0x93ff]))
print('thrust 160 ticks used', 5000-val(m2) if False else None)
