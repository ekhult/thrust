import sys,os
lo,hi=int(sys.argv[1],16),int(sys.argv[2],16)
f='asm_8000.asm' if lo>=0x8000 and lo<0xC000 else ('asm_C000.asm' if lo>=0xC000 else ('asm_0800.asm' if lo>=0x800 else 'asm_0400.asm'))
for l in open(os.path.join(os.path.dirname(__file__),'../../re',f)):
    try: a=int(l[:4],16)
    except: continue
    if lo<=a<hi: print(l.rstrip())
