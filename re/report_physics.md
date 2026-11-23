# Thrust (C64) – ship, pod, bullets and fuel physics

Constants: `re/data/physics.json`. Sprites: `re/data/sprites/`, `re/data/sprites.json`. Reference implementation:
`tools/physics/model.py` (bit-exact against the emulator over 3000+ iterations with random input, with and without pod).
[M] measured, [C] code only, [M=C] port compared bit-for-bit.

## 1. Timing
* Main loop paced by CIA1 timer A (latch `$276A`); one iteration = 3 timer ticks = 30273 cycles = **32.55 Hz** (PAL).
  All numbers are per iteration. `$19` = iteration counter, reset at each life start.
* Rotation when `(it & 3) != 0` → full turn in 1.31 s. [M=C]
* Physics tick (gravity, thrust, drag, fuel burn) when `(it & 15) ∈ {0,3,5,8,11,13}`. [M=C]
* Rod torque/damping only on physics ticks with `(it&15) ∉ {3,11}`, and only while thrusting.
* Position and rod-angle integration every iteration.

## 2. State
| Var | Meaning |
|---|---|
| `$09:$08:$07` | x of system centre; integer = 4 hires px, 16 fraction bits |
| `$0C:$0B:$0A` | y of centre; integer = 2 lines, 8 fraction bits |
| `$14:$13:$12` / `$16:$15` | vx (24-bit) / vy (16-bit), signed |
| `$0D` | angle 0..31, 0 = up, S = +1 clockwise |
| `$1D:$1C:$1B` / `$20:$1F:$1E` | rod angle / rod angular velocity |
| `$54` | rod length samples−2 (14) |
| `$22` | pod attached; `$44` alive/death countdown; `$57` out of fuel; `$27` SPACE held |
Ship = centre + offset(rod), pod = centre − offset(rod). Without pod: ship drawn 10 Y units above centre.

## 3. Tables
```
TY = [-640,-627,-591,-532,-452,-355,-244,-124,0,124,244,355,452,532,591,627,
       640, 627, 591, 532, 452, 355, 244, 124,0,-124,-244,-355,-452,-532,-591,-627]
TX = [0,62,122,177,226,266,295,313,320,313,295,266,226,177,122,62,
      0,-62,-122,-177,-226,-266,-295,-313,-320,-313,-295,-266,-226,-177,-122,-62]
interp(T, a16, n=16): i=(a16>>8)&31, k=(a16&0xFF)>>4 ; = (n-k)*T[i] + k*T[i+1]   (for n=16)
```
Gravity per level `$A8F7` = [5,7,9,11,12,13] (1/256 Y unit per tick); reversed = −(g+1); start angle 16.

## 4. Per-iteration update
```
if (it & 3) != 0: ang += (S) - (A); ang &= 31
x = (x + vx) mod 2^24 ; y = (y + sext(vy)) mod 2^24
if dead or pod_attached: rod = (rod + av) mod 2^21
... death logic, objects, pickups, firing ...
if dead and not pod and exploded: vy = 0; vx &= 0xFF
elif (it & 15) in {0,3,5,8,11,13}:
    vy += gravity
    if alive and fuel and THRUST:
        burn 1 fuel
        sh = 5 if pod else 4
        vx += (TX[ang]*256) >> sh ; vy += TY[ang] >> sh
        if (it & 15) not in {3,11}:
            d = ((ang<<8) - (rod>>8) + 8) & 0x1FFF
            av = av + (interp(TX,d) >> 1) - (av >> 6) - 1
    vx -= vx >> 6 ; vy -= vy >> 8
it += 1
a = ((rod>>8)+8) & 0x1FFF
ox = interp(TX,a,rodlen+2) >> 2 ; oy = interp(TY,a,rodlen+2) >> 2   (1/256 units)
ship = centre + (ox,oy) ; pod = centre - (ox,oy)
```
No speed limit except drag. Free-fall terminal vy ≈ 4.98 Y units/it.

## 5. Fuel
BCD, start 1000. Thrust: 1 unit per physics tick (~12.2/s). Shield/tractor: 1 unit per iteration when SPACE held and
`$1A` bit 1 set (~16/s; shield sprite flickers in sync). Refuel +11 per iteration while in zone; after 26 iterations
the cell is removed (+300 score) → 286 fuel. Zone: alive, no pod, SPACE, 1 ≤ cellX−shipX ≤ 5, 0 ≤ cellY−shipY ≤ 27.
Out of fuel: no thrust/shield/tractor; game over when the life ends or the planet is left.

## 6. Shield / tractor / pod pickup
Shield sprite = pointer 32 (circle), colour 3, offset ~2.5 px towards the nose. Fire blocked while SPACE held.
Enemy bullets in box 3..5 X, 2..6 Y of the ship are destroyed by the shield, otherwise they kill.
Pickup: d = min(|dx|,|dy|) + 3·max(|dx|,|dy|) (sprite px). SPACE and d < 117 → lock (tow line shown); still SPACE and
d ≥ 132 → attach. Attach: centre = midpoint, velocities halved, rod angle from geometry, angular velocity from
cross product; 10 frames collision grace. The pod is never released voluntarily.

## 7. Player bullets
RETURN, edge-triggered, max 4 (slots 0-3), not while SPACE/dead. Spawn at ship + (4 X, 5 Y), velocity
(TX,TY)/256 per it (5 px) plus the ship's motion; advanced 2 steps at once; life 40 it. Removed outside screen or
when outside the row's open span. Hit boxes w = 5,5,5,5,4,5,5,2,2; h = 8,8,8,8,10,8,10,8,8.

## 8. Collisions, death, respawn
Hardware sprite collision: ship vs bitmap (`%10`/`%11` pixels = terrain, bullets), ship vs object sprites (skipped
while rod/tow line shown), pod vs bitmap. Ship crash: 8 particles, velocity zeroed, 60 it countdown, rod shrinks;
the pod explodes 8 it later. Pod crash: pod explodes, ship falls without thrust and explodes 8 it later.
Then lives−1, restart at a restart point (with pod attached if collected). Level exit: centre y < 288 while alive.
Planet destroyed while still there → death.

## 9. Sprites
Pointer = angle (frames 0..31 at `$4000 + angle*64`), hires single colour, ship colour 7. Shield 32, pod 33 (colour
5), 34-46 objects, 47-48 fuel beam. Explosions are 8 bitmap particles each.
