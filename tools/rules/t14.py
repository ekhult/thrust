from h import *
c = start_game(extra=40)
m=c.cpu.m; m[0xa3]=0
st=bytearray(m[7:0xd]); st[4]=0x10; st[5]=1; m[7:0xd]=st
c.writes_watch={0x8f4e:[]}
import collections
chars=[]
def tr(pc):
    if pc==0x8f4e: chars.append((c.frame,chr(c.cpu.a)))
for f in range(260):
    c.run_frame(trace=tr if f<200 else None)
print(''.join(ch for fr,ch in chars), chars[0][0] if chars else None, chars[-1][0] if chars else None)
