from h import *
SP = '/private/tmp/claude-501/-Users-fredrik-nehr--claude-spares-spare-yPz7ib/612663e4-7f51-450a-8afb-d616c88f3a87/scratchpad/'
c = boot(); m = c.cpu.m
for f in range(80): c.run_frame()
# teleport centre
m[0x09] = 141; m[0x08] = 0; m[0x07] = 0
m[0x0c] = 440 >> 8; m[0x0b] = 440 & 255; m[0x0a] = 0
for a in range(0x12, 0x17): m[a] = 0
rows = []
def snap(c):
    rows.append(dict(fr=c.frame, it=m[0x19], c=(m[9]+m[8]/256, (m[0xc]<<8|m[0xb]) + m[0xa]/256), ship=(m[0x33]+m[0x32]/256, (m[0x30]<<8|m[0x2f])+m[0x2e]/256),
        spr=(m[0x4f]*256+m[0x4e], m[0x50]), pod=(m[0x52]*256+m[0x51], m[0x53]), p27=m[0x27], p68=m[0x68], p45=m[0x45], p22=m[0x22],
        rod=(m[0x1d]<<16|m[0x1c]<<8|m[0x1b])/65536, av=((m[0x20]^0x80)-0x80)+(m[0x1f]<<8|m[0x1e])/65536,
        vx=((m[0x14]^0x80)-0x80)+(m[0x13]<<8|m[0x12])/65536, vy=((m[0x16]^0x80)-0x80)+m[0x15]/256, ang=m[0xd]))
it = Iter(c, snap)
for f in range(260):
    c.keys = {'SPACE'}
    if 40 <= f: c.keys.add('LSHIFT')
    c.run_frame(trace=it.tr)
    if f in (30, 120, 200, 259): save_png(c.render(), SP + f'attach{f}.png')
for r in rows:
    print(r)
