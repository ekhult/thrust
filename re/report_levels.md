# Thrust (C64) – levels, landscape and objects

Data: `re/data/levels.json`, `re/data/level_1..6.png`, `re/data/objects/sprite_XX.png` (+ `_x4` enlargements).
Scripts in `tools/levels/`: `decode.py` (terrain streams + doors), `objects.py` (object tables), `generate.py`
(writes JSON/PNGs), `verify_streams.py`, `verify_emu.py` (checks against the real game code).
[V] = verified in the emulator / by running the game's own code, [C] = read from code only.

## 1. Coordinates
* x unit = 4 hires px (2 multicolour px), range 0..255. Ship X = `$09` (`$08` fraction). [V]
* y unit = 1 row = 2 raster lines. Ship Y = `$0C:$0B` (`$0A` fraction). Objects/bullets use the same units. [V]
* Terrain row y drawn only on world line 2y (striped look). PNGs: `png_x = 4x`, `png_y = 2(y-256)`.
* Directions 0..31, 0 = up, clockwise. S increments `$0D`, A decrements (`$9E09`).

## 2. Landscape format [V]
* One open interval per row: x open iff `L(y) <= x < R(y)`; rows below level height are solid. Sky = L 0, R 255.
* Two edge streams (L, R) of `(count, delta)` pairs; pointers `$A8FD/$A903` (L counts), `$A909/$A90F` (L deltas),
  `$A915/$A91B` (R counts), `$A921/$A927` (R deltas). Start value 0 (L) / 255 (R); each step adds delta (mod 256)
  and yields the next row; count 0 = 256; entry 0 runs 255 steps. Stream row r = world y r-256. Terminated by (255,0)
  with L == R.
* Ring buffer `$0400+(y&255)` = L, `$0500+(y&255)` = R. Renderer `$828B` XOR-draws 91 rows per frame, pattern `%10`.
  No fine horizontal scroll (camera_x moves 4 px).
* Bullet vs terrain: `x < L(y) || x >= R(y)` (`$A3FE`). Ship vs terrain: VIC sprite-background collision `$D01F`. [C]
* Level heights (rows): 463, 586, 736, 747, 927, 1045. Escape when ship y < 288 (`$0C==1 && $0B<$20`, `$B3D5`).
* Horizontal wrap `$9111`: camera_x kept 1..175; ±175 shift of camera, ship, bullets.

## 3. Doors (levels 4–6) [V]
| Level | Rows | Closed | Open | Max o |
|---|---|---|---|---|
| 4 | 617..629 | L = 174 = R | L = 174 - o | 16 |
| 5 | 836..856 | L = 166 = R | L = 152 if (y-835) <= o else 166 | 21 |
| 6 | 880..894 | L = R | k=y-880, c=192-o, L = c+k (k<7) else c+14-k | 18 |
Shooting a switch (type 7/8) sets timer t (`$6B`) = 255, decremented per frame. Each frame: if t >= max, o =
min(o+1,max) else o = t. Door code `$917D`.

## 4. Objects [V]
Hires single-colour sprites (multiplexer `$8B52`). Tables per level: x, y lo, y hi, type ($FF end), flags
(pointers `$A95E/$A96A/$A976/$A982/$A98E`). Sprite top-left at world px (4x, 2y+3): the VIC starts a sprite on raster Y+1 and the playfield runs with
vertical fine scroll 0 (corrected after the collision verification in `tools/collide`; an earlier renderer
started sprites one line early and gave 2y+2).
| Type | Object | Sprites | Hitbox w×h |
|---|---|---|---|
| 0-3 | limpet gun | `$22+type` | 5×8 |
| 4 | fuel cell | `$26`+`$27` or `$2E` | 4×10 |
| 5 | pod | `$28` + pedestal `$29` | 5×8 |
| 6 | reactor | `$2A` + dome `$2B` | 5×10 |
| 7/8 | switch (left/right wall) | `$2C`/`$2D` | 2×8 |
Bullet hits object if `0 <= bx-x < w && 0 <= by-y < h` (`$8617`); types 0-4 destroyable.
Guns: type 0 ground slope down-right, spawn (x+4,y); 1 ceiling, (x+4,y+8); 2 ground slope down-left, (x+1,y);
3 ceiling, (x+1,y+8). Flags bits 2-4 = dir_base, bits 0-1 = random mask 1/3/7/15. Direction =
`(rand & mask) + dir_base + (rand & 3)` mod 32. Fires when on screen, reactor not disabled (`$3D==0`), not critical,
and `rand < $A3` (`$8740`). [C]
Fuel pickup: tractor on, `1 <= x-ship_x <= 5`, `0 <= y-(ship_y-10) <= 27`, 26 frames (`$07E0`). [C]

## 5. Restart points [V]
Table `$A8DF/$A8E5`, n = `$A873` (1,1,3,3,4,5), columns: ship_y hi, ship_y lo, camera_x, camera_row hi/lo, ship_x.
Level start = entry 0: ship (108,401), camera_x 86, camera_row 301. After death: first entry with y >= death y;
step back one if pod not attached; pod flag kept unless last entry.

## 6. Colours per level
| Table | L1 | L2 | L3 | L4 | L5 | L6 | Use |
|---|---|---|---|---|---|---|---|
| `$A92D` | 2 | 5 | 3 | 14 | 8 | 4 | terrain |
| `$A939` | 5 | 2 | 13 | 5 | 10 | 3 | pod |
| `$A93F` | 5 | 3 | 5 | 3 | 2 | 3 | status labels |
| `$A945` | 5 | 14 | 8 | 2 | 3 | 10 | guns, pedestal, reactor dome |
| `$A94B` | 3 | 8 | 5 | 10 | 13 | 2 | ship colour with shield, FUEL text |
Gravity `$A8F7` = 5,7,9,11,12,13 added to vy on 6 of 16 frames (`$95BA`), negated when reversed. [C]
Gun fire rate `$A3`: starts 2; later `$AF8A` (+1 per level from 3rd, cap $23) + `$AF8B` (8 if planet destroyed). [C]

## 7. Camera (`$9014`)
Playfield 320×181 lines; shows x in [camera_x, camera_x+80), rows [camera_row+65, camera_row+156).
Horizontal: d = ship_x - camera_x; d<20 → speed d-20; d>50 → d-50; moving right stops when d<29 (slows by 1/frame
while d<50), mirrored for left (stop d>=41). Vertical: e = ship_y - camera_row - 56; down: e>=70 → speed vy_hi+1;
up: e<32 → vy_hi-1; stop down when e<45, up when e>=57.
