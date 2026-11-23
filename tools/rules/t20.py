from h import *
def cycle(n_wraps_before, a6a5, a5, aF8C=0, aF8D=0):
    c = start_game(extra=40); m=c.cpu.m
    m[0xa6a4]=5; m[0xa4]=5; m[0xb681]=6; m[0xa6a5]=a6a5; m[0xa5]=a5; m[0xaf8c]=aF8C; m[0xaf8d]=aF8D
    m[0x22]=0xff
    st=bytearray(m[7:0xd]); st[4]=0x10; st[5]=1; m[7:0xd]=st
    chars=[]
    def tr(pc):
        if pc==0x8f4e: chars.append(chr(c.cpu.a) if c.cpu.a>=32 else '|')
    for f in range(900):
        c.run_frame(trace=tr)
        if m[0xa6a4]==0 and m[0x19]>5: break
    print('in A6A5=%02x A5=%02x -> A6A5=%02x A5=%02x grav $A7=%02x $A6=%02x AF8C=%02x AF8D=%02x mission=%x' % (a6a5,a5,m[0xa6a5],m[0xa5],m[0xa7],m[0xa6],m[0xaf8c],m[0xaf8d],m[0xb681]), repr(''.join(chars)))
    return c
cycle(0,0,0)
c=cycle(0,0xff,0)
shot(c,'out/invisible.png')
cycle(0,0,0xff)
cycle(0,0xff,0xff)
