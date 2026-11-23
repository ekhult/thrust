import os
M=open(os.path.join(os.path.dirname(os.path.abspath(__file__)),'../../re/game_running.bin'),'rb').read()
def ptr(lo,hi,lv): return M[lo+lv]|M[hi+lv]<<8
def stream(c,d,init,maxrows=4000):
    """row k (k>=0) value. returns list and segments"""
    a=init; x=0xff; y=0; vals=[a]; segs=[]
    while len(vals)<maxrows:
        if x==0:
            y+=1; x=M[c+y]
            if M[c+y]==0xff and M[d+y]==0 and False: pass
        a=(a+M[d+y])&0xff; x=(x-1)&0xff
        vals.append(a)
    return vals
def segments(c,d,n=40):
    return [(M[c+i],M[d+i]) for i in range(n)]
def level(lv,maxrows=4000):
    cA=ptr(0xa8fd,0xa903,lv); dA=ptr(0xa909,0xa90f,lv)
    cB=ptr(0xa915,0xa91b,lv); dB=ptr(0xa921,0xa927,lv)
    return cA,dA,cB,dB
if __name__=='__main__':
    for lv in range(6):
        cA,dA,cB,dB=level(lv)
        print(lv,hex(cA),hex(dA),hex(cB),hex(dB))
        print('  L',segments(cA,dA,30))
        print('  R',segments(cB,dB,30))

def edges(lv):
    """returns L,R lists indexed by row, length = rows covered by both tables"""
    cA,dA,cB,dB=level(lv)
    nxt = {0:None}
    out=[]
    for c,d,init,end in ((cA,dA,0,cB if False else dA),(cB,dB,0xff,dB)):
        n=d-c
        cnts=[M[c+i] for i in range(n)]; dl=[M[d+i] for i in range(n)]
        a=init; vals=[a]
        # first segment: x starts at $FF -> 255 steps with delta[0]
        for i in range(n):
            cnt = 255 if i==0 else (cnts[i] or 256)
            for k in range(cnt):
                a=(a+dl[i])&0xff; vals.append(a)
        out.append((vals,cnts,dl))
    return out

# Doors: hard-coded in $917D (called every game frame from $9014). They overwrite the LEFT edge
# buffer ($0400) for a fixed range of rows. 'o' = opening counter $6C (0 = closed).
DOORS = {
    3: dict(rows=(0x269, 0x269+12), max_open=0x10),   # level 4: L = $AE - o for 13 rows
    4: dict(rows=(0x344, 0x358), max_open=0x15),      # level 5: rows 836..856, open from top
    5: dict(rows=(0x370, 0x370+14), max_open=0x12),   # level 6: wedge 15 rows
}
def door_L(lv, Y, o):
    """left edge override for world row Y with door opening o, or None if row not a door row"""
    if lv == 3 and 0x269 <= Y <= 0x269+12: return 0xAE - o
    if lv == 4 and 0x344 <= Y <= 0x358:
        y = Y - 0x343           # 1..21 ($920B loop counter)
        return 0x98 if y <= o else 0xA6
    if lv == 5 and 0x370 <= Y <= 0x370+14:
        k = Y - 0x370; c = 0xC0 - o
        return c + k if k < 7 else c + 14 - k
    return None
def spans(lv, door_open=0):
    """world rows Y=0..H-1 -> (L,R) open interval [L,R) in x units, doors applied"""
    (L,_,_),(R,_,_) = edges(lv)
    n = min(len(L), len(R)) - 256
    out = []
    for Y in range(n):
        l, r = L[Y+256], R[Y+256]
        d = door_L(lv, Y, door_open)
        if d is not None: l = d
        out.append((l, r))
    return out
