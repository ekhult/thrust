import sys
m=open('../../re/game_running.bin','rb').read()
def tab(base,lv): return m[base+lv] | m[base+6+lv]<<8
def run(lv, n):
    cA=tab(0xa8fd,lv) ; dA=m[0xa909+lv]|m[0xa90f+lv]<<8
    cB=m[0xa915+lv]|m[0xa91b+lv]<<8; dB=m[0xa921+lv]|m[0xa927+lv]<<8
    st=[[0,0xff,0,cA,dA],[0,0xff,1,cA,dA],[0xff,0xff,0,cB,dB],[0xff,0xff,1,cB,dB]]
    out=[]
    for i in range(n):
        row=[]
        for s in st:
            a,x,y,c,d=s
            if x==0:
                y=(y+1)&0xff; x=m[c+y]
            a=(a+m[d+y])&0xff; x=(x-1)&0xff
            s[0],s[1],s[2]=a,x,y
            row.append(a)
        out.append(row)
    return out
if __name__=='__main__':
    lv=int(sys.argv[1])
    print('ptrs', hex(tab(0xa8fd,lv)))
    for i,r in enumerate(run(lv,int(sys.argv[2]))):
        print(i, r)
