"""Extract sprite frames from the running-game RAM snapshot -> PNGs + sprites.json"""
import os, sys, json, zlib, struct, base64
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, '..'))
from c64 import C64
PAL = C64.PAL
RE = os.path.join(HERE, '..', '..', 're')
OUT = os.path.join(RE, 'data', 'sprites')
os.makedirs(OUT, exist_ok=True)
m = open(os.path.join(RE, 'game_running.bin'), 'rb').read()

def png_rgba(w, h, px, path, scale=1):
    raw = bytearray()
    for y in range(h):
        for _ in range(scale):
            raw.append(0)
            for x in range(w):
                raw += bytes(px[y][x]) * scale
    def chunk(t, d):
        c = struct.pack('>I', len(d)) + t + d
        return c + struct.pack('>I', zlib.crc32(t + d) & 0xffffffff)
    open(path, 'wb').write(b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>IIBBBBB', w*scale, h*scale, 8, 6, 0, 0, 0))
                           + chunk(b'IDAT', zlib.compress(bytes(raw), 9)) + chunk(b'IEND', b''))

def decode(data, colour):
    rows = []
    for y in range(21):
        r = []
        for x in range(24):
            b = data[y*3 + x//8]
            r.append(PAL[colour] + (255,) if b & (0x80 >> (x % 8)) else (0, 0, 0, 0))
        rows.append(r)
    return rows

# frame -> (name, colour) ; colours as set by the game (all sprites hires, no expansion)
frames = {}
for a in range(32):
    frames[a] = (f'ship_{a:02d}', 7)              # ptr = angle ($0D), sprite 7, colour $9798 = 7 yellow
frames[32] = ('shield', 3)                        # ptr $20 while SPACE active, colour $9797 = 3 cyan
frames[33] = ('pod', 5)                           # ptr $21, sprite 6, colour $9AAF = 5 green
for p in range(34, 47):
    frames[p] = (f'object_{p}', 1)                # level objects (multiplexed sprites 0-5); colour from object tables
frames[47] = ('fuelbeam_top', 7)                  # $AE97: ptr $2F/$30, colour 7, drawn below the ship while refuelling
frames[48] = ('fuelbeam_bottom', 7)
meta = {'note': 'C64 sprite frames from VIC bank $4000 (address = $4000 + ptr*64). 24x21, 3 bytes per row, '
                'hires (multicolour flag $D01C = 0 for all sprites), no X/Y expansion. Colours are C64 palette indices.',
        'palette': {i: '#%02x%02x%02x' % c for i, c in enumerate(PAL)},
        'angle_to_pointer': 'ptr = angle (0..31) for the ship; 32 ($20) = shield, 33 ($21) = pod',
        'frames': []}
sheet = [[(0, 0, 0, 255)] * (26*16) for _ in range(23*4)]
for p, (name, col) in frames.items():
    data = m[0x4000 + p*64: 0x4000 + p*64 + 63]
    img = decode(data, col)
    png_rgba(24, 21, img, os.path.join(OUT, f'{p:02d}_{name}.png'), scale=1)
    png_rgba(24, 21, img, os.path.join(OUT, f'{p:02d}_{name}_x4.png'), scale=4)
    meta['frames'].append({'pointer': p, 'address': '$%04X' % (0x4000 + p*64), 'name': name, 'multicolour': False,
                           'colour': col, 'hex': data.hex(), 'base64': base64.b64encode(data).decode()})
    sx, sy = (p % 16) * 26, (p // 16) * 23
    for y in range(21):
        for x in range(24):
            if img[y][x][3]: sheet[sy+y][sx+x] = img[y][x]
png_rgba(26*16, 23*4, sheet, os.path.join(OUT, 'contact_sheet_x3.png'), scale=3)
json.dump(meta, open(os.path.join(RE, 'data', 'sprites.json'), 'w'), indent=1)
print('wrote', len(frames), 'frames')
