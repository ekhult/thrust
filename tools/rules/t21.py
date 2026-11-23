from h import *
c = boot(); m=c.cpu.m
chars=[]; ev=[]
def tr(pc):
    if pc==0x8f4e: chars.append((c.frame,chr(c.cpu.a) if c.cpu.a>=32 else '|'))
prev=None
for f in range(1300):
    c.run_frame(trace=tr if f%1==0 else None)
    st=(m[0x63],m[0xaf8e],m[0x19]>0)
    if st[:1]!=(prev or (None,))[:1]: ev.append((f,'$63=%02x'%m[0x63]))
    prev=st
    if f in (600,900,1200): shot(c,f'out/title_{f}.png')
s=''; lastf=-99
for fr,ch in chars:
    if fr-lastf>3: s+=f'\n[{fr}] '
    s+=ch; lastf=fr
print(s); print(ev); print('AF8E',m[0xaf8e])
