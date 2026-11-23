from h import *
import sys
def run(mode):
    c = start_game(extra=40)
    m=c.cpu.m; m[0xa3]=0
    if mode.startswith('crit'):
        r=[o for o in objs(c) if o['type']==6][0]; t=0
        while m[0x6a]==0xff:
            if t%6==0: inject_bullet(c,0,r['x']+2,r['y']+3)
            tick(c); t+=1
    if mode.endswith('pod'): m[0x22]=0xff
    st=bytearray(m[7:0xd]); st[4]=0x10; st[5]=1; m[7:0xd]=st
    chars=[]
    def tr(pc):
        if pc==0x8f4e: chars.append(chr(c.cpu.a) if c.cpu.a>=32 else '|')
    for f in range(500): c.run_frame(trace=tr)
    print(mode, repr(''.join(chars)), 'score', m[0x182:0x17f:-1].hex(), 'lvl', m[0xa4], 'A3', m[0xa3], 'lives', m[0x9403])
for mode in sys.argv[1:]: run(mode)
