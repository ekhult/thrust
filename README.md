# Thrust for macOS

A native macOS remake of **Thrust** (Firebird, 1986, Commodore 64). It was built by reverse engineering the C64
disk image in `Thrust_C64_EN.zip`. Levels, graphics, physics and rules are taken from the original machine code
and data. The music and sound effects are the original code (Rob Hubbard's player and the game's SFX driver),
running on a built-in 6502 emulator that drives a SID synthesiser.

## Play

```bash
open ThrustMac/build/Thrust.app
```

Or install it into /Applications with the installer package `ThrustMac/build/Thrust-1.0.pkg`. The package is
not signed with an Apple Developer ID, so macOS blocks it the first time. To open it, Control-click the package
and choose Open, or click "Open Anyway" under System Settings ▸ Privacy & Security.

To rebuild the app (needs the Xcode command line tools, macOS 13 or later):

```bash
ThrustMac/build_app.sh
```

To rebuild the installer package as well:

```bash
ThrustMac/build_pkg.sh
```

| Action | Keys (original keys in brackets) | Game controller |
|---|---|---|
| Rotate left / right | A / S, ← / → | stick or d-pad |
| Thrust | Shift (or ↑, Ctrl) | A, right trigger |
| Fire | Return | B, right shoulder |
| Tractor beam / shield | Space (or ↓) | X, left trigger |
| Start | Space / Return | Menu |
| Pause / continue | P or F5 / F7 | |
| Sound toggle | M (F1 off, F3 on) | |
| Abort to title | Esc (RUN/STOP) | |
| Full screen | ⌃⌘F | |

View ▸ Scanlines adds a CRT-style scanline effect.

### How to play
* Hover just above the Klystron pod, hold the tractor beam, then thrust away until the tow bar locks.
* Fly off the top of the planet with the pod to complete the mission.
* Hold the tractor beam over a fuel cell to refuel.
* Shoot the reactor to silence the limpet guns for a while. Hit it too often and it goes critical: you then
  have 10 seconds to get off the planet. If you escape with the pod in time, you get an extra 2000 bonus.
* After 6 planets, gravity reverses. After 12, the landscape becomes invisible.

## What is faithful to the original
* **Landscape and objects:** all 6 planets come from the original edge-stream data and object tables. That
  includes the doors and switches on planets 4–6 and all restart points.
* **Physics:** a bit-exact port of the ship/pod physics, verified against the running C64 code over thousands of
  frames. It covers the main loop at 32.55 Hz, gravity per planet, thrust tables, drag, rod torque and the pod
  attach routine.
* **Rules and scoring:** the same as the original.
  * Gun fire probability, aiming and difficulty progression.
  * Reactor damage, recharge and countdown.
  * Fuel use and refuelling.
  * Bonuses, extra ship every 10,000 points.
  * The 24-planet gravity/invisibility cycle.
  * The top-8 high-score table, saved between runs.
* **Graphics:** the original sprites, font and status-bar charset, shown in the C64 palette at 320×200.
* **Modern touches:** smooth 60+ fps rendering, with interpolation between the original 32.55 Hz game ticks.
  Also resizable/full-screen window, game controller support, and optional scanlines.
* **Collisions:** the C64 detected crashes with its graphics chip, so the remake does the same pixel test in
  software. That test was checked against the original: `tools/c64.py` emulates the VIC's collision registers,
  and `tools/collide` places the ship (with and without the pod) at 1,624 positions on all 6 planets, near walls,
  floors, ceilings and objects, in both games. They agree on every position where the ship is on screen.
* **Not implemented:** the attract-mode demo.

## Repository layout
| Path | Contents |
|---|---|
| `ThrustMac/` | Swift package for the game. `build_app.sh` creates `build/Thrust.app`. |
| `re/` | Reverse-engineering results. |
| `re/report_*.md` | Write-ups: levels, physics, rules/sound. |
| `re/data/` | Extracted levels (JSON + PNG maps), sprites, font and sound data. |
| `re/asm_*.asm` | Disassembly listings. |
| `tools/` | Python tools used for the analysis. |
| `tools/cpu6502.py`, `tools/c64.py` | A 6502 emulator and a small C64 harness that runs the original game and renders screenshots. |
| `tools/unpack.py`, `tools/runmem.py` | Unpack the cracked/crunched PRG through its three packer layers. |
| `tools/levels`, `tools/physics`, `tools/rules` | Extraction and verification scripts. |
| `tools/assets/build_assets.py` | Generates the game's resource files from `re/`. |

`ThrustMac/.build/debug/Thrust --autotest <dir> <script>` runs the game headless with scripted input and writes
screenshots. It is useful for regression checks.
