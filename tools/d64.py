"""Minimal D64 (1541 disk image) reader: list directory and extract files."""
import sys, os

SECTORS = [21]*17 + [19]*7 + [18]*6 + [17]*10

def offset(track, sector):
    return (sum(SECTORS[:track-1]) + sector) * 256

def read_chain(img, t, s):
    data = bytearray()
    seen = set()
    while t and (t, s) not in seen:
        seen.add((t, s))
        blk = img[offset(t, s):offset(t, s)+256]
        nt, ns = blk[0], blk[1]
        if nt == 0:
            data += blk[2:ns+1]
        else:
            data += blk[2:]
        t, s = nt, ns
    return bytes(data)

def directory(img):
    entries = []
    t, s = 18, 1
    while t:
        blk = img[offset(t, s):offset(t, s)+256]
        for i in range(8):
            e = blk[i*32:(i+1)*32]
            ftype = e[2]
            if ftype == 0:
                continue
            name = e[5:21].rstrip(b'\xa0').decode('latin1')
            entries.append((name, ftype & 7, e[3], e[4], e[30] | e[31] << 8))
        t, s = blk[0], blk[1]
    return entries

if __name__ == '__main__':
    img = open(sys.argv[1], 'rb').read()
    out = sys.argv[2] if len(sys.argv) > 2 else None
    hdr = img[offset(18, 0):offset(18, 0)+256]
    print('Disk:', hdr[0x90:0xa0].rstrip(b'\xa0').decode('latin1'))
    for name, ft, t, s, blocks in directory(img):
        data = read_chain(img, t, s) if t else b''
        load = data[0] | data[1] << 8 if len(data) >= 2 else 0
        print(f'{name!r:20} type={["DEL","SEQ","PRG","USR","REL"][ft]} blocks={blocks} len={len(data)} load=${load:04X} end=${load+len(data)-2:04X}')
        if out:
            os.makedirs(out, exist_ok=True)
            safe = ''.join(c if c.isalnum() else '_' for c in name)
            open(os.path.join(out, safe + '.prg'), 'wb').write(data)
