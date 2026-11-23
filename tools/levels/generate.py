"""Extract Thrust (C64) level data from the RAM snapshot re/game_running.bin.

Writes re/data/levels.json, re/data/level_N.png (N=1..6) and re/data/objects/*.png.
Run: python3 generate.py   (from any directory)

Coordinate system ("world units", identical to the game's own variables):
  x : 0..255, one unit = 4 hires pixels = 2 multicolour pixels  (ship $09, objects, terrain edges)
  y : rows, one row = 2 raster lines                            (ship $0C:$0B, objects)
  terrain row Y is drawn on world line 2*Y (the line 2*Y+1 is always empty -> striped look)
PNG: 1 PNG pixel = 1 hires pixel (multicolour pixels are 2 PNG pixels wide), png_x = 4*x,
     png_y = 2*(Y - PNG_Y0).
"""
import os, sys, json, zlib, struct
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from decode import M, spans, DOORS, door_L, level as stream_ptrs
from objects import objects

ROOT = os.path.normpath(os.path.join(HERE, '..', '..'))
OUT = os.path.join(ROOT, 're', 'data')
os.makedirs(os.path.join(OUT, 'objects'), exist_ok=True)

PAL = [(0,0,0),(255,255,255),(136,57,50),(103,182,189),(139,63,150),(85,160,73),(64,49,141),(191,206,114),
       (139,84,41),(87,66,0),(184,105,98),(80,80,80),(120,120,120),(148,224,137),(120,105,196),(159,159,159)]
NAMES = ['black','white','red','cyan','purple','green','blue','yellow','orange','brown','light red','dark grey',
         'grey','light green','light blue','light grey']
PNG_Y0 = 256          # first world row shown in level PNGs (everything above is empty sky)
EXIT_Y = 0x120        # ship Y < 288 ($0C=1,$0B<$20, $B3D5) -> planet left

def write_png(path, rows):
    h = len(rows); w = len(rows[0])
    raw = bytearray()
    for r in rows:
        raw.append(0)
        for c in r: raw += bytes(c)
    def chunk(t, d):
        c = struct.pack('>I', len(d)) + t + d
        return c + struct.pack('>I', zlib.crc32(t + d) & 0xffffffff)
    open(path, 'wb').write(b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>IIBBBBB', w, h, 8, 2, 0, 0, 0))
                           + chunk(b'IDAT', zlib.compress(bytes(raw), 9)) + chunk(b'IEND', b''))

def sprite_bits(ptr):
    a = 0x4000 + ptr * 64
    return [[(M[a + y*3 + x//8] >> (7 - x % 8)) & 1 for x in range(24)] for y in range(21)]

def sprite_rows_str(ptr):
    return [''.join('#' if b else '.' for b in row) for row in sprite_bits(ptr)]

def bbox(ptr):
    bits = sprite_bits(ptr)
    xs = [x for y in range(21) for x in range(24) if bits[y][x]]
    ys = [y for y in range(21) for x in range(24) if bits[y][x]]
    return [min(xs), min(ys), max(xs) + 1, max(ys) + 1] if xs else None

# ---------------- per-level tables ----------------
def tbl(addr, lv): return M[addr + lv]
def restarts(lv):
    b = M[0xa8df+lv] | M[0xa8e5+lv] << 8; n = M[0xa873+lv]
    f = [[M[b+k*n+i] for i in range(n)] for k in range(6)]
    return [dict(ship_x=f[5][i], ship_y=f[0][i]*256+f[1][i], camera_x=f[2][i], camera_row=f[3][i]*256+f[4][i])
            for i in range(n)]

# sprite pointers / colour sources used by the object drawer $889B
FUEL_COL_A = M[0x84ea]; REACTOR_COL_A = M[0x84ed]; SWITCH_COL = M[0x84ef]   # constants (7 = yellow)
HITBOX_W = [M[0x84f1+t] for t in range(9)]   # x size (units)  used by bullet hit test $8617
HITBOX_H = [M[0x84fa+t] for t in range(9)]   # y size (rows)
GUN_SHOT_DX = [M[0x87fe+t] for t in range(4)]
GUN_SHOT_DY = [M[0x8802+t] for t in range(4)]
GUN_MOUNT = {0: 'on ground sloping down to the right (dome up/right)',
             1: 'hanging from ceiling rising to the right (dome down/right)',
             2: 'on ground sloping down to the left (dome up/left)',
             3: 'hanging from ceiling rising to the left (dome down/left)'}

def obj_sprites(lv, ob):
    """list of (sprite pointer, C64 colour) drawn for this object, in draw order"""
    t = ob['type']; gun_col = tbl(0xa945, lv)
    if t < 4: return [(0x22 + t, gun_col)]
    if t == 4:
        # $84F0 = object index + 1: odd -> two sprites ($26 tank + $27 'FUEL' text), even -> one combined sprite $2E
        if (ob['i'] + 1) & 1: return [(0x26, FUEL_COL_A), (0x27, tbl(0xa94b, lv))]
        return [(0x2e, FUEL_COL_A)]
    if t == 5: return [(0x28, tbl(0xa939, lv)), (0x29, gun_col)]
    if t == 6: return [(0x2a, REACTOR_COL_A), (0x2b, gun_col)]
    return [(0x25 + t, SWITCH_COL)]

TYPE_NAME = {0: 'limpet_gun', 1: 'limpet_gun', 2: 'limpet_gun', 3: 'limpet_gun', 4: 'fuel', 5: 'pod',
             6: 'reactor', 7: 'switch', 8: 'switch'}

def build_level(lv):
    sp_closed = spans(lv, 0)
    # level height: last row whose span is open (in any door state) + 1; everything below is solid
    sp_open = spans(lv, DOORS[lv]['max_open']) if lv in DOORS else sp_closed
    last_open = max(y for y in range(len(sp_closed)) if sp_closed[y][0] < sp_closed[y][1] or sp_open[y][0] < sp_open[y][1])
    H = last_open + 1 + 8
    first_terrain = min(y for y in range(len(sp_closed)) if sp_closed[y] != (0, 255))
    rows = [list(sp_closed[y]) for y in range(H)]
    _, objs = objects(lv)
    olist = []
    for ob in objs:
        t = ob['type']
        sprs = obj_sprites(lv, ob)
        e = dict(type=TYPE_NAME[t], type_id=t, index=ob['i'], x=ob['x'], y=ob['y'],
                 sprite_px=[4*ob['x'], 2*ob['y'] + 2],
                 sprites=[dict(ptr=f'${p:02X}', file=f'objects/sprite_{p:02X}.png', colour=c) for p, c in sprs],
                 hitbox=dict(x=ob['x'], y=ob['y'], w=HITBOX_W[t], h=HITBOX_H[t]),
                 flags=ob['flags'])
        if t < 4:
            base = ob['flags'] & 0x1c; mask = [1, 3, 7, 15][ob['flags'] & 3]
            e.update(variant=t, mount=GUN_MOUNT[t], fire_dir_base=base, fire_dir_rand_mask=mask,
                     fire_dir_range=[base, (base + mask + 3) & 31],
                     shot_spawn=[ob['x'] + GUN_SHOT_DX[t], ob['y'] + GUN_SHOT_DY[t]])
        if t == 4: e['pickup_note'] = 'collected with tractor beam while x - ship_x in 1..5 and y - (ship_y - 10) in 0..27, for 26 frames (see report)'
        if t == 5: e['note'] = 'Klystron pod ($28) resting on its pedestal ($29); both sprites at the same position'
        if t == 6: e['note'] = 'reactor: block+chimney sprite $2A plus dome sprite $2B'
        if t in (7, 8):
            e['variant'] = t
            e['opens_door'] = 0
            e['note'] = 'shooting it sets door timer $6B=$FF (any switch opens the level\'s single door)'
        olist.append(e)
    doors = []
    if lv in DOORS:
        a, b = DOORS[lv]['rows']; mx = DOORS[lv]['max_open']
        doors.append(dict(id=0, rows=[a, b], max_open=mx,
                          left_edge_by_row_closed={str(y): door_L(lv, y, 0) for y in range(a, b + 1)},
                          left_edge_by_row_open={str(y): door_L(lv, y, mx) for y in range(a, b + 1)},
                          formula={3: 'L = 174 - o for every door row',
                                   4: 'L = 152 if (Y - 835) <= o else 166  (opens from the top row down)',
                                   5: 'k = Y - 880; c = 192 - o; L = c + k for k<7 else c + 14 - k (wedge)'}[lv],
                          switches=[o['index'] for o in olist if o['type'] == 'switch'],
                          animation='shooting any switch sets timer t($6B)=255; t decrements by 1 every game frame while >0. '
                                    'Each game frame (only while the door is inside the row buffer, see active_when): '
                                    f'if t >= {mx}: o = min(o+1, {mx}) else o = t. o($6C)=0 closed, {mx}=fully open. '
                                    'Both are 0 after level start / restart.',
                          active_when={3: '0 <= 617 - camera_row <= 240', 4: '0 <= 835 - camera_row <= 232',
                                       5: '0 <= 880 - camera_row <= 238'}[lv]))
    rp = restarts(lv)
    cA, dA, cB, dB = stream_ptrs(lv)
    col = dict(
        background=0,
        terrain=tbl(0xa92d, lv),
        bitmap_01=tbl(0xa933, lv),
        bitmap_11=tbl(0xa939, lv),
        status_labels=tbl(0xa93f, lv),
        gun=tbl(0xa945, lv), pod_pedestal=tbl(0xa945, lv), reactor_dome=tbl(0xa945, lv),
        reactor_block=REACTOR_COL_A, fuel_tank=FUEL_COL_A, fuel_text=tbl(0xa94b, lv), pod=tbl(0xa939, lv),
        switch=SWITCH_COL, ship=7, ship_shield=tbl(0xa94b, lv),
        raw_tables={'A92D': tbl(0xa92d, lv), 'A933': tbl(0xa933, lv), 'A939': tbl(0xa939, lv),
                    'A93F': tbl(0xa93f, lv), 'A945': tbl(0xa945, lv), 'A94B': tbl(0xa94b, lv)})
    return dict(
        level=lv + 1, index=lv,
        units=dict(x='1 unit = 4 hires px = 2 multicolour px', y='1 row = 2 raster lines',
                   world_px='px_x = 4*x, px_y = 2*y (hires pixel space, C64 pixel aspect)'),
        width=256, height=H, width_px=1024, height_px=2 * H,
        first_terrain_row=first_terrain, exit_y=EXIT_Y,
        terrain=dict(
            format='open_spans: one [L, R] per row y = 0..height-1; x is open (empty) iff L <= x < R, '
                   'everything else (and every row >= height) is solid rock. Rows are drawn only on the '
                   'even raster line 2*y; line 2*y+1 is always blank. Doors are applied CLOSED here.',
            open_spans=rows),
        doors=doors,
        colours=col,
        gravity=tbl(0xa8f7, lv),
        ship_start=dict(x=rp[0]['ship_x'], y=rp[0]['ship_y'], angle=0, camera_x=rp[0]['camera_x'],
                        camera_row=rp[0]['camera_row']),
        restart_points=rp,
        objects=olist,
        source=dict(edge_counts_L=f'${cA:04X}', edge_deltas_L=f'${dA:04X}', edge_counts_R=f'${cB:04X}',
                    edge_deltas_R=f'${dB:04X}',
                    object_tables=[f'${M[a+2*lv] | M[a+1+2*lv] << 8:04X}' for a in (0xa95e, 0xa96a, 0xa976, 0xa982, 0xa98e)]),
        png=dict(file=f'level_{lv+1}.png', origin_row=PNG_Y0, scale='1 PNG px = 1 hires px; png_x = 4*x, png_y = 2*(y - origin_row)'),
    )

def render_level(L):
    lv = L['index']; H = L['height']
    W = 1024; Hpx = 2 * (H - PNG_Y0)
    img = [[PAL[0]] * W for _ in range(Hpx)]
    tcol = PAL[L['colours']['terrain']]
    for y in range(PNG_Y0, H):
        l, r = L['terrain']['open_spans'][y]
        row = img[2 * (y - PNG_Y0)]
        for px in range(W):
            u = px // 4
            if not (l <= u < r): row[px] = tcol
    # objects (hires sprites, sprite pixel 1 = colour, 0 = transparent)
    for o in L['objects']:
        x0, y0 = o['sprite_px'][0], o['sprite_px'][1] - 2 * PNG_Y0
        for s in o['sprites']:
            bits = sprite_bits(int(s['ptr'][1:], 16))
            for yy in range(21):
                for xx in range(24):
                    if bits[yy][xx] and 0 <= y0 + yy < Hpx and 0 <= x0 + xx < W:
                        img[y0 + yy][x0 + xx] = PAL[s['colour']]
    write_png(os.path.join(OUT, L['png']['file']), img)

def main():
    levels = [build_level(lv) for lv in range(6)]
    for L in levels: render_level(L)
    # object sprite PNGs: 24x21 hires, white on transparent-black, scaled x4 for viewing + raw 1:1
    sprite_meta = {}
    for p in range(0x20, 0x30):
        bits = sprite_bits(p)
        img = [[(255, 255, 255) if b else (0, 0, 0) for b in row] for row in bits]
        write_png(os.path.join(OUT, 'objects', f'sprite_{p:02X}.png'), img)
        big = [[c for c in row for _ in range(4)] for row in img for _ in range(4)]
        write_png(os.path.join(OUT, 'objects', f'sprite_{p:02X}_x4.png'), big)
        sprite_meta[f'${p:02X}'] = dict(address=f'${0x4000 + p*64:04X}', size=[24, 21], bbox=bbox(p), rows=sprite_rows_str(p))
    meta = {
        'description': 'Thrust (C64, Firebird 1986) level data extracted from RAM; see re/report_levels.md',
        'coordinate_system': {
            'x': 'world x unit = 4 hires pixels = 2 multicolour pixels; 0..255 (ship $09, objects, terrain)',
            'y': 'world row = 2 raster lines; ship $0C:$0B, objects; terrain row y drawn on raster line 2*y only',
            'screen': 'camera_x = $62 (left edge in units), camera_row = $04:$03; visible x in [camera_x, camera_x+80), '
                      'visible rows y in [camera_row+65, camera_row+156) (bitmap lines 18..198, raster 66..246)',
            'object_sprite': 'hires 24x21 sprite, top-left at world px (4*x, 2*y+2)',
            'ship_sprite': 'no pod attached: top-left at world px (4*ship_x + 6, 2*ship_y - 18) (offset $24/$26 = 0/-10 rows)',
            'directions': '0..31, 0 = up, increasing clockwise (same as ship angle $0D)',
            'horizontal_wrap': 'camera_x is kept in 1..175: if it becomes >=176 (and <216) everything (camera, ship, bullets) '
                               'is shifted by -175 units; if 0 or >=216 by +175. Terrain/objects are NOT periodic.'},
        'palette_rgb': {str(i): PAL[i] for i in range(16)},
        'palette_names': {str(i): NAMES[i] for i in range(16)},
        'object_types': {'0-3': 'limpet gun (variant = mount orientation, sprite $22+type)', '4': 'fuel cell',
                         '5': 'Klystron pod on pedestal', '6': 'reactor', '7': 'switch (sprite $2C, ")" shape: mounted on a LEFT wall, bulge points right)',
                         '8': 'switch (sprite $2D, "(" shape: mounted on a RIGHT wall, bulge points left)'},
        'sprites': sprite_meta,
        'levels': levels,
    }
    json.dump(meta, open(os.path.join(OUT, 'levels.json'), 'w'), indent=1)
    print('wrote', os.path.join(OUT, 'levels.json'))
    for L in levels:
        print(L['level'], 'height', L['height'], 'objects', len(L['objects']), 'doors', len(L['doors']))

if __name__ == '__main__':
    main()
