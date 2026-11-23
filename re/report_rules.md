# Thrust (C64) – game rules, actors, UI and sound

Scope: limpet guns, reactor, fuel cells, doors, level flow/scoring, status bar/font, title/attract, sound.
Terrain format and ship/pod physics are covered by other reports.
Machine-readable data: `data/rules.json`, `data/sounds.json`, `data/sounds_frames.json`,
`data/music_sid_frames.json`, `data/font.json`, `data/font.png`, `data/charset_5800.png`, `data/statusbar.png`.
Scripts: `tools/rules/` (`h.py` holds the harness helpers: boot, start_game, tick, objs, inject_bullet,
freeze_ship, move_to, goto_level; the `t*.py` files are the experiments; `font.py`, `sfx.py`, `music.py`,
`make_json.py` generate the data files).

Tags: **[M]** = measured in the harness, **[C]** = read from the code only.

-----------------------------------------------------------------------------------------------
## 0. Timing and conventions

* **Game tick** = one pass of the main loop `$B1AD-$B274`, counted in `$19`. CIA1 timer A (latch `$276A`, set at
  `$B83E`) decrements `$B479`, and each tick uses 3 timer IRQs (`$B45A`). That gives 3*10091 cycles = 30.7 ms, i.e.
  **32.55 ticks/s** when the CPU keeps up. [C] In the harness this measured as 103 ticks per 159 video frames. [M]
  The harness has no badline emulation; on real hardware busy scenes can run slower.
* **IRQ frame** = 50.125 Hz raster IRQ (`$8943`), counted in `$1A`. All SFX timing and the message pauses
  (`$B3E8`: wait Y IRQ frames; RUN/STOP aborts to the title) use IRQ frames.
* Random generator `$AAB8` [C] (state s = `$3B`:`$3A`):
  ```
  t = ((s << 2) | 1) & 0xFFFF ; s = (s + t) & 0xFFFF ; hi(s) = (hi(s) + old_lo) & 0xFF ; return hi(s) ^ lo(s)
  ```
  Several callers also use `$3B` (the new hi byte) directly as a second random value.
* Direction table (32 steps, 0 = up, clockwise), shared by the ship, bullets and explosions (copied from `$B8F5`):
  `vy = $0880/$08A0[d]`, `vx = $0980/$09A0[d]`, in 1/256 units per tick. Values: vy = -640*cos, vx = 320*sin
  (y is in pixel lines, x in 2-pixel units). The full table is in `rules.json`.

-----------------------------------------------------------------------------------------------
## 1. Object list (positions: terrain report)

Arrays: x `$A1EE+i`, y lo/hi, type `$A1FA+i` (end marker `$FF`), flags `$A1FF+i`, state `$A352+i`
(bit1 = alive, bit0 = drawn this frame). The array pointers are patched per level at `$A70C`.
The object loop `$8571` runs once per tick.

| type | object | hit box WxH | when hit by a player bullet |
|---|---|---|---|
| 0-3 | limpet gun (graphic `$22+type`) | 5x8 | destroyed, **+750**, 8-particle explosion |
| 4 | fuel cell | 4x10 | destroyed, **+150** |
| 5 | Klystron pod on its pedestal | 5x8 | bullet absorbed |
| 6 | reactor | 5x10 | bullet absorbed, damage (section 3), 3-particle spark |
| 7, 8 | door switch | 2x8 | bullet absorbed, door opens (section 5), 3-particle spark |

Hit test (`$862F`) [C][M]: only player bullet slots 0-3 with owner 0 are tested.
`0 <= bx-ox < W && 0 <= by-oy < H` (y is 16-bit). On a hit the bullet is removed.
A destroyed object explodes at (ox+2, oy+4). Scores were verified by injecting bullets: 150 and 750. [M]

Bullet and particle pool, 32 slots:

| field | address |
|---|---|
| x frac / int | `$0600` / `$0620` |
| y frac / lo / hi | `$0640` / `$0660` / `$0680` |
| vx (8.8) | `$06A0` / `$06C0` |
| vy (8.8) | `$06E0` / `$0700` |
| life (bit7 = drawn) | `$0720` |
| owner | `$07A0` |

Owner codes: 0 = player shot, 1 = smoke/star/explosion (harmless), 2 = debris (harmless), 3 = gun bullet.
Every tick (`$A38E`): `pos += vel`, `life -= 1`. A slot is freed when life reaches 0, when it is outside the
256-line window at the scroll position, or when it is inside terrain (x outside [left_edge, right_edge) of its row).
Allocation `$9FDD`: the first free slot from 31 down to 1. If none is free it takes the first slot with life < 10,
otherwise slot 0.

-----------------------------------------------------------------------------------------------
## 2. Limpet guns

```
every tick, for each alive gun i (type 0..3) with gun_y_hi == scroll_y_hi     # $85: ~256 lines from the screen top; x NOT tested
   if $3D == 0 and $6A < 0 and rand8() < A3:                                     # $8740
       sfx gun_fire
       slot = alloc()
       r = rand8()                                     # also leaves a new $3B
       mask = [1,3,7,15][flags & 3] ; base = flags & $1C
       dir  = (($3B & mask) + base + (rand8() & 3)) & 31
       vel  = DIRTAB[dir]                              # ship velocity NOT added: 2.5 lines/tick vertically at most
       pos  = (gun_x + DX[type], gun_y + DY[type])     # DX = 4,4,1,1   DY = 0,8,0,8
       life = 40 ; owner = 3
```
* **Fire probability** per gun per tick = **A3/256**. Measured 0.0043 / 0.0353 / 0.149 / 0.493 for A3 = 1 / 9 / 35 / 128,
  against expected 0.0039 / 0.0352 / 0.137 / 0.5. [M]
* **A3** (difficulty, set at `$B123`). Missions 1 and 2 use 1. From mission 3 on, `$AF8A` is incremented every new
  planet, so A3 = mission-1, capped at **35**. A3 gets **+8** (`$AF8B`) for the planet after a
  "Planet destroyed without pod" failure. The demo uses 2. [C][M]
* **Directions**: the level-1 gun (flags `$1E`, base 28, mask 7) measured dirs 28..31 and 0..6, triangular
  distribution peaking around 31-3. [M]
* **Lifetime** 40 ticks. [M]
* A gun bullet kills the ship when `3 <= bx-ship_x < 6` and `2 <= by-ship_y < 7` and the shield is off.
  With the shield on, the bullet is absorbed (`$A49F`). [C]
* **Disabled**:
  * while the reactor recharge timer `$3D != 0`;
  * during the countdown;
  * for the first 30 ticks after every (re)spawn (`$3D = 15`, `$A5FB`).
* **Destroyed** by one player bullet (+750). A destroyed gun stays destroyed after you lose a life. Object states are
  reset only at a new planet (`$A6A7`).

-----------------------------------------------------------------------------------------------
## 3. Reactor (nuclear power plant)

State: `$3E` damage accumulator, `$3D` recharge timer, `$6A` countdown (`$FF` = inactive), `$69` 33-tick sub-counter.
```
on hit (type 6, $8679):  spark(3 particles) ; $3E = $3D = ($3E + (rand8() & 31) + C) & 255
                         if carry_out and $6A < 0:  $3D = 255 ; $6A = 10 ; $69 = 1          # CRITICAL
every 2nd tick (($19 & 1) == 0):  if $3D: $3D -= 1      # guns + smoke are off while $3D != 0  -> 2*$3E ticks
every tick ($8520):  $69 -= 1 ; if $69 < 0:  $69 = 32
                         if $6A >= 0: { if $6A > 0: $6A -= 1, sfx ping } ; draw digit $6A (status row1 col13 and col25)
                         if $6A == 0:  kill ship ($2A = 1) ; $B520 = $FF
```
* `$3E` is **cleared on every (re)spawn**. `$A5B9` clears zero page `$02-$9F`, so the `$3E = 50` written by
  `$A6A7` is dead. Dying therefore resets reactor damage and cancels a running countdown (`$6A = $FF`). [C][M]
  The first hit measured `$3E` 0 -> 16.
* "More shots = longer recharge": after each hit the guns are silent for **2*$3E ticks**, where `$3E` is the
  accumulated damage. That ranges from about 1 s up to about 15 s. [M]
* **Critical** when the sum passes 255. Typically 14-20 hits; one measured run took 17. [M]
* **Countdown** [M]:
  * Digit 9 appears 2 ticks after the critical hit, then one digit every 33 ticks (1.01 s), with a ping per digit.
  * "10" is never shown.
  * 0 is reached 299 ticks (9.2 s) after the critical hit.
* **Visuals**:
  * Healthy reactor: every 8th tick with `$3D == 0` it emits a smoke puff at (x+4, y), vy = -114/256 lines/tick,
    life 10, owner 1 (harmless). **Smoke means the guns are armed.**
  * Critical reactor: blinks (drawn when `($69 & 4) == 0`), no smoke.
* **At zero (planet explodes)** (`$85F6`) [M][C]:
  1. Every alive object except the pod explodes (no score). The ship explodes (`$44 = 60`).
  2. `$02 = 15` starts a background flash. The IRQ sets the playfield background `$D021 = $8B31[$02]` and decrements
     `$02` every 2nd IRQ frame. Colours: 6,2,4,5,3,7,1,1,7,3,5,4,2,6,0 (0.6 s).
  3. The landscape is hidden afterwards (`$AF8F = 0` while `$6A == 0`, `$B3B6`).
  4. A life is lost, then "Planet Destroyed / Mission N Failed / No Bonus", then the next planet with A3 + 8.
* Leaving the planet (section 6) while the countdown is running counts as destroying the planet.

-----------------------------------------------------------------------------------------------
## 4. Fuel cells

* **Shoot**: +150 and the cell is gone.
* **Collect** (tractor beam, `$86EB`). Conditions:
  * the ship is alive, no pod is attached, and SPACE is held;
  * `1 <= cell_x - ship_x($33) <= 5`;
  * `0 <= cell_y - ship_y($2F/$30) < 28`.

  Every tick that the conditions hold: `$3C = 1`, the cell counter `$07E0+i` goes up by 1, and fuel goes up by **11**
  (`$932E`, BCD). When the counter reaches **26**, the cell disappears with **+300** and a double ping.
  That is **286 fuel per cell**. The counter survives interruptions and deaths and is reset per planet.
  Measured: 26 ticks, +286 fuel (net +273 with the shield cost), +300 score. [M]
* **Fuel** (BCD `$93FF-$9401`, start 1000):
  * Thrust costs 1 per thrust tick, and thrust is only applied on 6 of 16 ticks (`$19 & 15` in {0,3,5,8,11,13}),
    giving 0.375/tick. [M]
  * Shield/tractor costs 1 on ticks with `($1A & 2) != 0`, about 0.5/tick. [M]
* **Out of fuel** (fuel 0): `$9402 = $FF`, `$57 = $FF`, thrust and shield stop working, and the display shows "0". [M]
  The next ship loss *or* planet exit is **Game Over**, even with lives left, shown as "Out of fuel" + "Game Over". [C]
  Collecting fuel afterwards does not clear `$9402`.

-----------------------------------------------------------------------------------------------
## 5. Doors and switches (planets 4, 5 and 6 only; `$917D`, every tick)

```
switch (type 7/8) hit by a bullet:  $6B = 255            # shooting again re-arms
every tick: if $6B: $6B -= 1
if the door rows lie within 241 lines of the scroll position:
    if $6B < MAX: $6C = $6B  elif $6C < MAX: $6C += 1      # opens 1/tick, held, closes 1/tick
    patch terrain left-edge buffer $0400 (ring offset $84B3) for the door rows
```
| level idx | MAX | world rows | values written to `$0400` | look |
|---|---|---|---|---|
| 3 (planet 4) | 16 | `$269`+0..12 | `$AE - open` | horizontal bar across a shaft retracts sideways |
| 4 (planet 5) | 21 | `$343`+1..21 | `$98` at row == open, `$A6` otherwise | 21-row plug opening row by row |
| 5 (planet 6) | 18 | `$370`+0..14 | rows 0-6 `$C0-open+k`, rows 7-14 decreasing | wedge slides |

Measured `$6B/$6C` on all three planets, with screenshots in `tools/rules/out/door*.png` [M]:
* Fully open after 16/21/18 ticks.
* Stays open until `$6B < MAX`, then closes over the same number of ticks.
* Fully closed 255 ticks (7.8 s) after the last switch hit.

Switches are indestructible. How the edge buffer is interpreted belongs to the terrain report.

**Other moving/animated things**:
* Pod and tow bar: physics report.
* Reactor smoke and blink: section 3.
* Explosions (`$9EF5`): 8 particles (3 for sparks). The start direction `$8C` (random for sparks) steps +4 per
  particle. Speed is DIRTAB/16 x (2..5 random). Life is roughly 8..40, and faster particles live shorter.
* Stars near the top of the map (`$A56D`): every 2nd tick while scroll_y < `$200`, a still particle at
  y = `$64` + rand, x = scroll_x + (rand & 63) + 5, life 30, owner 1/2 (two colours, so they twinkle).
* Beam-in/out cross animation: `$AEF1` / `$AEF7`.

-----------------------------------------------------------------------------------------------
## 6. Level flow, scoring, lives

**New game** (`$B045`) [C][M]:
* Score 0, fuel 1000.
* Lives `$9403 = 4`, then -1, so the display shows **3**: **4 ships** in total.
* Mission `$B681 = 0`. `$A4 = $A6A4 = $FF`, so the first level start increments them to 0.
* `$AF8A = 1`, `$AF8B/C/D = 0`.

**Level start** (`$B0B9`):
```
$A4 += 1 ; $A6A4 += 1
if $A6A4 == 6:  $A6A4 = 0 ; $A6A5 ^= $FF ; if $A6A5 == 0: $A5 ^= $FF
if $A6A5 and !$AF8C:  show "Reverse Gravity" 150 IRQ frames ; $AF8C = $96       # once per game
elif $A5 and !$AF8D:  show "Invisible Landscape" 150 IRQ frames ; $AF8D = $96   # once per game
$B681 += 1 (BCD mission number)
A3 = ($B681 >= 3 ? min(35, ++$AF8A) : 1) + $AF8B ; $AF8B = 0
$A6A7: all object states = alive, fuel counters = 0, gravity $A7 = $A8F7[idx] (XOR $FF if reverse, sign $A6)
$A5B9: clear zp $02-$9F, put the ship at the restart point, $6A = $FF, $3D = 15, ship angle 16 if reverse
```
* **24-planet cycle** [M]: planets 1-6 normal, 7-12 reverse gravity, 13-18 invisible landscape, 19-24 both,
  then repeat. Verified via the transitions and the messages.
* Level-1 gravity is 5 normally and `$FA` (-6) reversed.
* **Invisible landscape**: the terrain is not shown (colour screen `$5400`) unless SPACE (shield/tractor) is held or
  the ship is exploding. Objects stay visible. Player shots use colour pattern `$FF` instead of `$AA`. [M screenshot][C]

**Leaving the planet** (`$B3D5`): ship y (`$0B/$0C`) in **[$0100, $0120)** while the ship is not exploding, i.e. flying
off the top of the map. The game waits 3 frames, plays the beam-out cross, waits 20 frames, then [M]:

| situation | texts | result |
|---|---|---|
| pod attached (`$22`) | "Mission N Complete", then "Planet Destroyed" if the countdown runs, then "Bonus X" | +bonus, next planet (2 s) |
| no pod, no countdown | "Mission Incomplete" | **same planet again**, no life lost, mission number unchanged (1.2 s) |
| no pod, countdown running | "Planet Destroyed", "Mission  N  Failed", "No Bonus" | next planet, A3 + 8 (2.4 s) |
| fuel empty | "Out of fuel", "Game Over" | high-score check, title |

**Mission bonus** (`$B616`) [M]:
* `units = level_index + 5`, plus 5 more if the planet was destroyed.
* The score gets +400 per unit, and each addition can award an extra life.
* The bonus is printed as BCD `units*4` followed by "00".
* Result: **2000 / 2400 / 2800 / 3200 / 3600 / 4000** for planets 1-6 of the cycle, **+2000** if the planet was destroyed.
* Verified: level 1 = 2000, level 1 + destroyed = 4000, level 6 = 4000.

**Ship lost** (`$B289`): the explosion lasts 60 ticks, then:
1. Fuel empty: Game Over.
2. Otherwise lives -1 (BCD). If lives were already 0: Game Over.
3. If the countdown was running: the "Planet Destroyed / Failed" path (next planet).
4. Otherwise: restart the same planet at the last restart point (`$A5FF` tables, terrain report).

Measured [M]: deaths showed lives 3, 2, 1, 0; one more death ended the game (high-score entry appeared).

**Extra life**: lives +1 whenever the 10,000s digit of the score changes (`$92C8`, high nibble of `$0181`).
Verified: score 9990 + 750 took lives from 3 to 4. [M]

**Status values**:
* Score: BCD score/10 in `$0180-$0182`, printed as 6 digits with leading blanks. The final "0" is part of the
  status-bar art.
* Fuel: printed as 6 digits with leading blanks; when empty, "0" is printed (`$934C`).
* Lives: 2 digits, " 0" when zero.

**Game over** (`$B2A9`): "Out of fuel" (if applicable) and "Game Over" (colour 7), wait 90 IRQ frames, high-score
check `$B521`, then the title.

**High scores**:
* Table at `$0100`: 8 entries x 16 bytes (3 BCD score/10 bytes lo-first, then a 13-char name).
* Defaults: 8000, 7000, ..., 1000, all named "Firebird".
* The current score lives in slot 9 (`$0180`). It bubbles up while it is >= the entry above.
* If it places: "Congratulations" + "Please enter your name". The name is up to 10 chars from `$20-$7E`;
  DEL deletes, RETURN ends.
* Not original code: `$C000` saves the table to disk ("TOP 8"); it is the cracker's (REM) high-score saver.
  `$C322/$C33F` are trainer stubs from the same crack.

-----------------------------------------------------------------------------------------------
## 7. Status bar, font, texts

* The top 2 text rows (screen `$5C00` with `$D018 = $76`, or `$5400` with `$56`; charset `$5800`) hold chars
  `$00-$4F` in order. The status bar is an **80-char bitmap** in multicolour text mode.
  * Colour RAM, row 0: `$F` at cols 0-4, 10-16, 22-29, 35-39 and `$5` at cols 5-9, 17-21, 30-34. Row 1: `$7`.
  * The IRQ sets `$D021 = 7`, `$D022 = 0`, `$D023 = ($893C)` for this band.
  * The labels FUEL / LIVES / SCORE are pre-drawn in the charset.
* Values are **drawn into the charset** with the text font:

  | value | address | position |
  |---|---|---|
  | fuel | `$5959` | row1 col3 |
  | lives | `$59D1` | row1 col18 |
  | score | `$5A21` | row1 col28 |
  | countdown | `$59A9` and `$5A09` | row1 col13 and col25 |

  The playfield bitmap starts at raster `$41` (bitmap `$6000`). A separator row of chars `$70/$72` follows.
* **Text font** `$8E52`:
  * 37 glyphs x 5 rows, stored planar (row r of glyph i at `$8E52 + i + 37*r`), 8 px wide, advance 8 px.
  * Glyph order is `. A-Z 0-9`.
  * Printer `$8F4E`: digits -> glyphs 27-36, letters of either case -> 1-26, space -> blank cell, `$7F` -> backspace,
    anything else -> '.'.
  * The bytes go into a multicolour bitmap, so each bit pair is a colour index (00 bg, 01 screen hi-nibble,
    10 lo-nibble, 11 colour RAM). The colour comes from `$8E51`.
  * Files: `font.png` (top row hires, bottom row as MC pairs), `font.json` (glyph hex, char mapping, plus the
    2 KB charset `$5800` hex), `charset_5800.png` (all 256 chars), `statusbar.png`.
* **Message records** (`$0900+`, `$9515+`): bytes `lo, hi` give a bitmap address
  (cell = (addr - $6000)/8, screen row = cell/40, col = cell%40), then ASCII, then `$FF`.
  A record with address 0 continues at the cursor.

  | text | addr | row,col | colour |
  |---|---|---|---|
  | Top Eight Thrusters | `$6550` | 4,10 | `$84E9` |
  | Congratulations | `$6560` | 4,12 | `$84E9` |
  | high-score lines "N.   SSSSSS0   NAME" | `$67C8` +2 rows each | 6,9 | 7 |
  | Planet Destroyed | `$6920` | 7,12 | `$84E9` |
  | Out of fuel | `$6BB0` | 9,14 | `$84E9` |
  | Mission + N + Complete / In+Complete / Failed | `$6CD8` | 10,11 | level colour `$AE68` |
  | Invisible Landscape | `$6CD0` | 10,10 | 7 |
  | Reverse Gravity | `$6CE0` | 10,12 | 7 |
  | Game Over | `$6E38` | 11,15 | 7 |
  | Bonus + N + "00" | `$70B8` | 13,15 | 7 |
  | No Bonus | `$70C0` | 13,16 | 7 |
  | Press SPACE BAR to start | `$7438` | 16,7 | `$AE68` |
  | Please enter your name | `$7448` | 16,9 | `$AE68` |

  Messages appear on a cleared playfield. Exact strings with spacing:
  * "Mission 1 Complete"
  * "Mission  1  Failed"
  * "Mission Incomplete"
  * "Bonus 2000"

-----------------------------------------------------------------------------------------------
## 8. Title / attract sequence (`$AF94`) [M][C]

1. Silence the SID. `$A4 = $A5 = $A6A4 = $A6A5 = 0`, `$63 = $FF` (attract), `$AF8E = 140`, `$A3 = 2`.
   Level 1 is built as the backdrop (its objects show under the table).
2. Draw the high-score table, "Top Eight Thrusters" and "Press SPACE BAR to start" (about 1.5 s after boot).
3. Loop: SPACE starts the game. Every 2nd tick `$AF8E -= 1`; at 0, after **280 ticks (8.7 s)**, the demo starts.
4. **Demo**: level 1 with scripted keys. `$B4D7` reads key bitmasks from `$B4FC`
   (A=1, S=2, RETURN=4, SHIFT=8, SPACE=16) and tick durations from `$B50E`. Entries `$B516`, `$B51A` and `$B51B`
   are randomised per run at `$B14F`. In the measured run the demo picks up the pod.
   The demo ends on death, on planet exit, or on SPACE, and returns to step 1 (measured about 12 s).
   No SFX play during attract (`$63 != 0`), only the music.

-----------------------------------------------------------------------------------------------
## 9. Sound

**SFX driver**:
* `$9B58` runs on every raster IRQ (50 Hz, `$8A32`), in game only (`$63 == 0`).
* It writes `$D418 = $4F` (high-pass, volume 15), or 0 when F1 has set `$A2` (sound off; F3 clears it).
* Filter cutoff = `$50`<<3 = 640, resonance 0. Voice 1/2 routing comes from `$9B54` (thrust/shield/gun set their bit).
* Freq Hz = reg * 0.058725 (PAL).
* Exact per-frame register states from emulating the real driver: `sounds_frames.json` (`tools/rules/sfx.py`).
  Parameters: `sounds.json`.

| effect (trigger) | v | wave | freq | AD / SR | length / sweep | filter |
|---|---|---|---|---|---|---|
| player fire `$9D3D` | 2 | pulse, PW `$500`, lo -3/frame | `$1E00` (451 Hz), hi byte -1 per frame | `$13` / `$23` | gate 25 frames | no |
| gun fire `$9D85` | 2 | pulse, PW `$1xx` | `$0F00` (225 Hz) | `$23` / `$03` | gate 5 frames | HP |
| shield/tractor `$9D07` | 2 | pulse, PW `$1xx` swept | `$0800` (120 Hz) | `$00` / `$67` | held; gate off 10 frames after last trigger | HP |
| thrust `$9CCF` | 1 | noise | `$1400` | `$00` / `$B6` | held; gate off 8 frames after last trigger | HP |
| explosion `$9C94` | 1 | noise | `$05FF`; lo byte -5/frame, bouncing in [`$64`,`$C8`] | `$2A` / `$8C` | gate 30 frames, release 3 s; blocks thrust 50 frames | no |
| ping `$9C75` | 3 | saw | `$AA00` (2.5 kHz) | `$22` / `$02` | gate stays on, decays in ~64 ms | no |
| countdown digit `$9DD1` | 3 | ping | | | once per digit | |
| fuel cell finished / pod attached `$9DC4` | 3 | ping, then a second ping 9 frames later | | | | |

* Priorities: player fire is ignored while the shield sound is on. Gun fire is ignored while shield or player fire
  is sounding. Thrust is ignored during an explosion.
* The voice-2 pulse width lo byte is swept every frame by +/-5 between `$1E` and `$DC` (`$9B50`).
* There is no special reactor alarm. The countdown uses the ping, and the planet explosion fires one explosion
  trigger per exploding object.

**Music** (Rob Hubbard):
* Player code is at **`$2000-$2CAC`**. **Play entry `$3000` (= `JMP $2000`)** is called once per raster IRQ from
  `$8A38`.
* No init routine: the player state (`$2452-$2484`, zp `$E0-$FA`) is all zero in `mem_at_start.bin`, which is the
  song start. The music resumes where it stopped on each title visit.
* Each call first decrements `$246D` and skips the call when it underflows (reload 9), so 10 of every 11 calls advance
  the music.
* It plays only while `$63 != 0` (title/demo) and `$A2 == 0`. Otherwise `$2C96` mutes all voices once (`$246F`).
  **No in-game music.**
* Data:
  * frequency table `$238F` (16-bit lo/hi);
  * instruments `$2487` (8 bytes: PW lo, PW hi, ctrl, AD, SR, vibrato, PWM, fx flags);
  * track pointers `$2565`/`$2568`;
  * track lists `$25B9` / `$2657` / `$26EF` (pattern numbers, `$FF` = loop, `$FE` = stop);
  * pattern pointers `$256B` / `$2592`;
  * speed `$246C` = 2.
* **To render**: load `mem_at_start.bin`, set `$63 = $FF` and `$A2 = 0`, then `JSR $2000` at 50 Hz and feed
  `$D400-$D418` to a SID emulator. `tools/rules/music.py` does this. The register dump after every call is in
  `music_sid_frames.json`.
* The song restarts (all three track lists wrap together) after **20054 calls = 400 s**. [M]

-----------------------------------------------------------------------------------------------
## 10. Key variables

| address | meaning |
|---|---|
| `$63` | attract/demo flag |
| `$A2` | sound off |
| `$A3` | gun fire threshold |
| `$A4` | planets played |
| `$A6A4` | level index 0-5 |
| `$A6A5` | reverse gravity |
| `$A5` | invisible landscape |
| `$B681` | mission number (BCD) |
| `$3D` / `$3E` | reactor recharge / damage |
| `$6A` / `$69` | countdown |
| `$6B` / `$6C` | door timer / opening |
| `$22` | pod attached |
| `$27` | SPACE held (shield/tractor) |
| `$44` | ship explosion timer (`$FF` = alive) |
| `$2A` | kill-ship request |
| `$9402` | fuel empty |
| `$9403` | lives (BCD) |
| `$93FF-$9401` | fuel (BCD) |
| `$0180-$0182` | score/10 (BCD) |
| `$AF8A` / `$AF8B` | difficulty counter / +8 penalty |
| `$AF8C` / `$AF8D` | "message shown" flags |
| `$02` | planet-explosion flash |
| `$AF8F` | landscape visible (selects colour screen) |

Keys (`$B484` index = column*8 + row of the C64 matrix):
* A (`$0A`) rotate left, S (`$0D`) rotate right
* LSHIFT/RSHIFT (`$0F`/`$34`) thrust
* RETURN (`$01`) fire
* SPACE (`$3C`) shield/tractor
* F1/F3 sound off/on, F5/F7 pause/continue, RUN/STOP abort
