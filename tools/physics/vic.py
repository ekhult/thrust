from h import *
c = boot(); m = c.cpu.m
for f in range(160):
    c.keys = {"SPACE"} if 120 < f < 160 else set()
    c.run_frame()
    if f in (100, 150):
        print('frame', f)
        for line in (60, 120, 200, 250):
            regs, dd = c.linestate[line]
            print(' line', line, 'D015 %02x D01C %02x D017 %02x D01D %02x D025 %x D026 %x cols' % (regs[0x15], regs[0x1c], regs[0x17], regs[0x1d], regs[0x25]&15, regs[0x26]&15),
                  [regs[0x27+i]&15 for i in range(8)], 'xy', [(regs[2*i]|((regs[0x10]>>i)&1)<<8, regs[2*i+1]) for i in range(8)], 'D018 %02x' % regs[0x18], 'ptrs5C', list(m[0x5ff8:0x6000]), 'ptrs54', list(m[0x57f8:0x5800]))
        save_png(c.render(), f'/private/tmp/claude-501/-Users-fredrik-nehr--claude-spares-spare-yPz7ib/612663e4-7f51-450a-8afb-d616c88f3a87/scratchpad/vic{f}.png')
