from decode import M
TYPES={0:'gun',1:'gun',2:'gun',3:'gun',4:'fuel',5:'pod',6:'reactor',7:'switch',8:'switch'}
def objects(lv):
    p=[M[0xa95e+16*0+2*lv] | M[0xa95f+2*lv]<<8]
    p=[(M[base+2*lv] | M[base+1+2*lv]<<8) for base in (0xa95e,0xa96a,0xa976,0xa982,0xa98e)]
    px,pyl,pyh,pt,pf=p
    out=[]
    i=0
    while M[pt+i]!=0xff:
        out.append(dict(i=i,x=M[px+i],y=M[pyl+i]|M[pyh+i]<<8,type=M[pt+i],flags=M[pf+i]))
        i+=1
    return p,out
if __name__=='__main__':
    for lv in range(6):
        p,o=objects(lv)
        print(lv,[hex(a) for a in p])
        for ob in o: print('   ',ob, TYPES.get(ob['type']), 'dirbase',(ob['flags']&0x1c), 'mask', [1,3,7,15][ob['flags']&3])
