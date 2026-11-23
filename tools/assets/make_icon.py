"""App icon: the original ship sprite over a striped Thrust landscape."""
import zlib, struct, os, sys
ram = open(os.path.join(os.path.dirname(__file__), '..', '..', 're', 'game_running.bin'), 'rb').read()
N = 1024
img = [[(0, 0, 0, 0)] * N for _ in range(N)]
R = 180  # corner radius
def inside(x, y):
    m = 100; s = N - 2 * m
    cx = min(max(x, m + R), m + s - R); cy = min(max(y, m + R), m + s - R)
    return m <= x < m + s and m <= y < m + s and (x - cx) ** 2 + (y - cy) ** 2 <= R * R
red = (0x88, 0x39, 0x32, 255); yellow = (0xB8, 0xC7, 0x6F, 255); green = (0x58, 0x8D, 0x43, 255)
for y in range(N):
    for x in range(N):
        if not inside(x, y): continue
        c = (8, 8, 16, 255)
        # landscape: slope from the left, flat valley, plateau on the right; stripes every other 12px band
        ground = 760 - max(0, 380 - x) * 0.45 if x < 640 else 640
        if y > ground and (y // 12) % 2 == 0: c = red
        img[y][x] = c
# ship sprite frame 0 (24x21), scale 22 -> centred
spr = ram[0x4000:0x4000 + 63]
S = 22
ox, oy = (N - 24 * S) // 2 + S, 170
for r in range(21):
    for b in range(24):
        if spr[r * 3 + b // 8] & (0x80 >> (b % 8)):
            for yy in range(S):
                for xx in range(S):
                    img[oy + r * S + yy][ox + b * S + xx] = yellow
# pod
pod = ram[0x4000 + 33 * 64: 0x4000 + 33 * 64 + 63]
S2 = 10; px, py = (N - 24 * S2) // 2 + 8, 600
for r in range(21):
    for b in range(24):
        if pod[r * 3 + b // 8] & (0x80 >> (b % 8)):
            for yy in range(S2):
                for xx in range(S2):
                    img[py + r * S2 + yy][px + b * S2 + xx] = green
# tow rod
for y in range(oy + 21 * S - 60, py + 40):
    for x in range(N // 2 - 4, N // 2 + 4):
        if inside(x, y) and img[y][x] != yellow: img[y][x] = red
raw = bytearray()
for row in img:
    raw.append(0)
    for p in row: raw += bytes(p)
def chunk(t, d):
    return struct.pack('>I', len(d)) + t + d + struct.pack('>I', zlib.crc32(t + d) & 0xffffffff)
open(sys.argv[1], 'wb').write(b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>IIBBBBB', N, N, 8, 6, 0, 0, 0)) +
                              chunk(b'IDAT', zlib.compress(bytes(raw), 9)) + chunk(b'IEND', b''))
