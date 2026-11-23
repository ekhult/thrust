# Thrust (C64, Firebird 1986) – reverse engineering notes

## Files
- `game_running.bin` – 64 KB RAM snapshot taken while the game is running level 1 (after ~700 frames of play).
- `mem_at_start.bin` – 64 KB RAM after all unpacking, just before the game's entry `$6C24` (code still at its load
  addresses; the entry relocates `$3000-$6CFF` → `$8280-…` and `$6C55-…` → `$4000-…` then jumps to `$B683`).
- `asm_0400.asm`, `asm_0800.asm`, `asm_8000.asm`, `asm_C000.asm` – linear disassemblies of `game_running.bin`
  (data is disassembled as code too; be careful). Format: `ADDR  BYTES  mnemonic operand`.
- `jsr_trace.txt` – every JSR target executed in menu/game phase with call count and callers.
- Original manual text (controls/scoring) is in `../extracted` docs; summary below.

## Tools (in ../tools, run with python3 from the tools dir)
- `cpu6502.py` – 6502 core. `dis.py <bin> <startHex> <endHex>` – disassembler.
- `c64.py` – C64 harness: `C64(ram)`; `.cpu` (regs a,x,y,sp,pc, `.m` memory bytearray); `.keys` = set of key names
  pressed (see `KEYS` dict: 'A','S','LSHIFT','RETURN','SPACE','F1'...); `.run_frame(trace=fn)` runs one PAL frame
  (raster IRQ + CIA timer emulated; KERNAL calls stubbed as RTS); `.render()` → 320x200 RGB rows; `save_png(img, path)`.
  `.writes_watch = {addr: []}` records (frame, pc, value) of writes to those addresses.
- `play.py` / `trace_jsr.py` – examples: start at `$6C24` from `mem_at_start.bin`, press SPACE around frame 150 to
  start the game; gameplay starts ~frame 160. Python runs ~300 frames/s.
- You can also poke memory (e.g. move the ship, set level number) between frames for experiments.

## Hardware setup
- VIC bank 1 (`$4000-$7FFF`), `$DD00`=`%xx10`. Top status area: text mode, screen `$5C00`/`$5400` (double buffered,
  `$D018`=`$76`/`$56`), charset `$5800`. From raster `$41`: multicolour **bitmap** at `$6000`, colours from
  screen `$5C00`/`$5400` + colour RAM. The playfield is software rendered into the bitmap.
- IRQ handler `$8943` (raster IRQ via `$0314`, list of raster splits at `$0E00`); CIA1 timer A IRQ decrements
  `$B479` (game speed limiter; main loop waits on it at `$B016`).
- `jsr $3000` in the IRQ = sound/music driver.
- Keyboard scan `$9DE2` → 8 bytes at `$9DDA`; `$B484` with X = key index tests a key (0 = pressed? check).
  Rotation `$9E09`: X=$0A (A) / X=$0D (S); runs only when `($19 & 3) != 0`.

## Zero page (partially known)
- `$07,$08,$09` ship X (fraction, low, high) ; `$0A,$0B,$0C` ship Y (fraction, low, high)
- `$12,$13,$14` X velocity (24-bit signed add) ; `$15,$16` Y velocity (16-bit signed, sign-extended) – see `$9E28`
- `$0D` ship angle 0..31 ; `$19` frame counter (main loop) ; `$1A` frame counter (IRQ)
- `$1B,$1C,$1D` + `$1E,$1F,$20` : something angular (pod/pendulum?) – `$1D & 31` – see `$9E59`
- `$A4` level number (0-based, keeps increasing), `$A6A4` level index 0..5 (wraps), `$A6A5` reverse gravity flag
  (toggles each time 6 levels are completed), `$A5` "invisible landscape" flag.
- `$B681/$B682` BCD counters (levels completed?), `$AF8A..$AF8D` misc.
- Per-level tables (6 entries, indexed by `$A6A4`): `$A92D` (colour), `$A933`, `$A939`, `$A93F`, `$A945`, `$A94B`;
  `$A8DF/$A8E5/$A8EB/$A8F1` pointers and `$A873` counts used for restart points (`$A5FF`).

## Main loop (`$B1AD`…`$B274`)
`$B4D7, $B3B6, $9E09 (rotate), $9E28 (move ship), $9014, $B45A, $B2C8, $8571, $B470, $AE3B, $8BE8, $8B41,
$828B, $A99A, $A38E, $975F, $9E77, $9388, $9588, $B3D5` then death/level-end checks.
Level start: `$B0B9`…`$B14C` → `$A6A7`, `$A5B9` (→ `$A75F` sets level colours / clears screens).

## Game rules (from the original manual)
Keys: A rotate anticlockwise, S clockwise, SHIFT thrust, RETURN fire, SPACE tractor beam/shield, F1/F3 sound
off/on, F5 pause, F7 continue, RUN/STOP abort.
Shoot the reactor to temporarily disable limpet guns (more shots = longer recharge); too many shots → critical, 10 s
to leave. Pick up Klystron pod (hover above, tractor beam, thrust away; tow bar attaches). Fuel: hover over fuel cell
with tractor beam. Scores: limpet gun 750, destroy fuel cell 150, pick up fuel 300, mission completion bonus varies,
destroy planet bonus 2000, mission failure no bonus. Extra ship every 10000. Game over when no ships or out of fuel.
After 6 planets: reverse gravity; then "something even more deadly" (invisible landscape).
