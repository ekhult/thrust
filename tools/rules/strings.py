from h import *
m = open(ROOT+'/re/game_running.bin','rb').read()
def recs(base, offs):
    for o in offs:
        a = base+o; x,y = m[a], m[a+1]; s=''; a+=2
        while m[a] < 0x80: s += chr(m[a]); a+=1
        print(f'${base+o:04X}: x={x:02X} y={y:02X} term={m[a]:02X} "{s}"')
recs(0x0900, [0x00,0x0c,0x22,0x34,0x4d,0x68])
recs(0x9500, [0x15,0x20,0x25,0x30,0x39,0x42,0x4d,0x60,0x72])
