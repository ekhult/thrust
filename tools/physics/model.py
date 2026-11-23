"""Port-ready reference model of the Thrust (C64) ship / pod physics, one main-loop iteration.
All values are integers exactly like the 6502 code.  Units:
  x  : 24-bit, 1/65536 'X unit' ($09:$08:$07). 1 X unit = 4 hires pixels (= 2 multicolour pixels)
  y  : 24-bit, 1/256   'Y unit' ($0C:$0B:$0A). 1 Y unit = 2 raster lines
  vx : 24-bit signed, same units as x ($14:$13:$12)
  vy : 16-bit signed, same units as y ($16:$15)
  ang: 0..31 ship angle ($0D), 0=up, increases clockwise
  rod: 24-bit, 1/65536 angle step ($1D:$1C:$1B), top byte & 31
  av : 24-bit signed, rod angular velocity ($20:$1F:$1E)
"""
# thrust / direction tables ($0880/$08A0 = Y, $0980/$09A0 = X), signed 16-bit
TY = [-640, -627, -591, -532, -452, -355, -244, -124, 0, 124, 244, 355, 452, 532, 591, 627,
      640, 627, 591, 532, 452, 355, 244, 124, 0, -124, -244, -355, -452, -532, -591, -627]
TX = [0, 62, 122, 177, 226, 266, 295, 313, 320, 313, 295, 266, 226, 177, 122, 62,
      0, -62, -122, -177, -226, -266, -295, -313, -320, -313, -295, -266, -226, -177, -122, -62]
PHYS_TICKS = (0, 3, 5, 8, 11, 13)     # ($19 & 15) values on which velocity is updated
NO_TORQUE = (3, 11)                    # of those, ticks without rod torque/damping

def s24(v):
    v &= 0xFFFFFF
    return v - 0x1000000 if v & 0x800000 else v
def s16(v):
    v &= 0xFFFF
    return v - 0x10000 if v & 0x8000 else v

def interp16(table, a16, nsamples=16):
    """sum of nsamples samples of table at angle a16 (8.8 fixed point, already rounded by caller)
    switching from table[i] to table[i+1] after (nsamples - n) samples, n = frac>>4  ($967D / $98D4)"""
    i = (a16 >> 8) & 31; n = (a16 & 0xFF) >> 4
    s = table[i]
    for x in range(nsamples - 2, -1, -1):          # X = nsamples-2 .. 0
        if n == x + 1: i = (i + 1) & 31
        s += table[i]
    return s

class Ship:
    def __init__(s):
        s.x = s.y = s.vx = s.vy = 0; s.ang = 0; s.rod = 0; s.av = 0
        s.it = 0            # $19
        s.p22 = 0           # $22 != 0 : pod attached
        s.p44 = 0xFF        # $44 : bit7 set = alive, else death countdown
        s.p42 = 0xFF        # $42 : $FF alive, 1 just exploded, 0 afterwards
        s.grav = 5          # 16-bit signed gravity ($A6:$A7); reverse = ~g (i.e. -g-1)
        s.rodlen = 14       # $54
        s.fuel_ok = True    # $57 == 0

    def step(s, rot, thrust, fuel_cb=None):
        """rot: -1 (A), +1 (S), 0 ; thrust: bool (SHIFT held).  One main-loop iteration."""
        t = s.it & 15
        # $9E09 rotation, 3 of every 4 iterations
        alive = bool(s.p44 & 0x80); pod = s.p22 != 0
        if s.it & 3:
            s.ang = (s.ang + rot) & 31
        # $9E28 integrate position
        s.x = (s.x + s.vx) & 0xFFFFFF
        s.y = (s.y + s.vy) & 0xFFFFFF
        if (not alive) or pod:
            s.rod = (s.rod + s.av) & 0x1FFFFF          # top byte masked & 31
        # $9588 velocity update
        if not alive and not pod and s.p42 == 0:
            s.vy = 0; s.vx = s.vx & 0xFF                  # zeroes $16,$15,$14,$13 (not $12)
        elif t in PHYS_TICKS:
            s.vy = s16(s.vy + s.grav)
            if alive and s.fuel_ok and thrust:
                if fuel_cb: fuel_cb()
                sh = 5 if pod else 4
                s.vx = s24(s.vx + ((TX[s.ang] * 256) >> sh))
                s.vy = s16(s.vy + (TY[s.ang] >> sh))
                if t not in NO_TORQUE:
                    d = ((s.ang << 8) - (s.rod >> 8) + 8) & 0x1FFF
                    S = interp16(TX, d) >> 1
                    old = s.av
                    s.av = s24(s.av + S - (old >> 6) - 1)
            s.vx = s24(s.vx - (s.vx >> 6))
            s.vy = s16(s.vy - (s.vy >> 8))
        s.it = (s.it + 1) & 0xFF

    def offset(s):
        """$98B2: ship = centre + offset, pod = centre - offset.  Returns (ox in 1/256 X unit, oy in 1/256 Y unit)"""
        a = ((s.rod >> 8) + 8) & 0x1FFF
        n = s.rodlen + 2
        return interp16(TX, a, n) >> 2, interp16(TY, a, n) >> 2


# ----------------------------------------------------------------------------------------------
# Pod attach ($995F-$9AAB): exact port operating on a copy of zero page (bytes, index = address).
# Helper ops reproduce 6502 carry behaviour where it matters.
def attach(zp, rodlen=14):
    z = bytearray(zp)
    C = 0
    def adc(a, b):
        nonlocal C
        r = a + b + C; C = r >> 8; return r & 255
    def sbc(a, b):
        nonlocal C
        r = a - b - (1 - C); C = 0 if r < 0 else 1; return r & 255
    def ror(v):
        nonlocal C
        r = (v >> 1) | (C << 7); C = v & 1; return r
    def rol(v):
        nonlocal C
        r = ((v << 1) | C) & 255; C = v >> 7; return r
    # centre = midpoint of ship ($31-$33 / $2E-$30) and pod ($64/$65, $66/$67 + $80 frac)
    C = 0; z[0x08] = adc(z[0x32], z[0x64]); a = adc(z[0x33], z[0x65]); z[0x09] = ror(a); z[0x08] = ror(z[0x08])
    C = 0; z[0x0a] = adc(z[0x2e], 0x80); z[0x0b] = adc(z[0x2f], z[0x66]); a = adc(z[0x30], z[0x67])
    z[0x0c] = ror(a); z[0x0b] = ror(z[0x0b]); z[0x0a] = ror(z[0x0a])
    # halve velocities (momentum conservation, equal masses)
    C = z[0x16] >> 7; z[0x16] = ror(z[0x16]); z[0x15] = ror(z[0x15])
    C = z[0x14] >> 7; z[0x14] = ror(z[0x14]); z[0x13] = ror(z[0x13]); z[0x12] = ror(z[0x12])
    # ship - centre, X scaled <<2 (-> pixels), Y scaled <<1 (-> lines)
    z[0x74] = sbc(z[0x32], z[0x08]); z[0x75] = sbc(z[0x33], z[0x09])
    z[0x74] = rol(z[0x74]); z[0x75] = rol(z[0x75]); z[0x74] = rol(z[0x74]); z[0x75] = rol(z[0x75])
    z[0x72] = z[0x75]
    z[0x76] = sbc(z[0x2e], z[0x0a]); z[0x77] = sbc(z[0x2f], z[0x0b])
    z[0x76] = rol(z[0x76]); z[0x77] = rol(z[0x77]); z[0x73] = z[0x77]
    # coarse-to-fine search for the rod angle whose offset best matches (ship - centre)
    # NOTE: $98B2 uses $7A as scratch, clobbering the low byte of the search step ($7B:$7A) with
    # (candidate_lo + 8).  This bug is reproduced here; it makes the search coarse/irregular.
    s_hi, s_lo = 0x0A, 0xAB; rlo, rhi = 0, 0; levels = 7
    while True:
        best = 0xFF; blo, bhi = rlo, rhi
        for k in range(3):
            a16 = ((rhi << 8 | rlo) + 8) & 0x1FFF
            s_lo = (rlo + 8) & 255                      # clobber
            ox = (interp16(TX, a16, rodlen + 2) >> 2) & 0xFFFF
            oy = (interp16(TY, a16, rodlen + 2) >> 2) & 0xFFFF
            ax = ((ox << 2) >> 8) & 255; ay = ((oy << 1) >> 8) & 255
            def absdiff(p, q):
                r = p - q; c = 0 if r < 0 else 1; r &= 255
                if r & 0x80: r = ((r ^ 0xFF) + 1 + c) & 255
                return r
            dxa = absdiff(ax, z[0x75]); dya = absdiff(ay, z[0x77])
            hi, lo = max(dxa, dya), min(dxa, dya)
            d = lo + 3 * hi; d = 0xFF if d > 0xFF else d
            if d < best: best = d; blo, bhi = rlo, rhi
            t = rlo + s_lo; rlo = t & 255; rhi = (rhi + s_hi + (t >> 8)) & 31
        rlo, rhi = blo, bhi
        st = (s_hi << 8 | s_lo) >> 1; s_hi, s_lo = st >> 8, st & 255
        levels -= 1
        if levels == 0: break
        r = ((rhi << 8 | rlo) - st) & 0x1FFF; rhi, rlo = r >> 8, r & 255
    rod = rhi << 8 | rlo
    z[0x1c] = rod & 255; z[0x1d] = rod >> 8
    # angular velocity from the cross product  v x r  (16-bit signed products, >>2)
    def mul(a8, b8):
        a = a8 - 256 if a8 & 0x80 else a8; b = b8 - 256 if b8 & 0x80 else b8
        return (a * b) & 0xFFFF
    vx16 = ((z[0x14] << 4) | (z[0x13] >> 4)) & 255
    vy16 = ((z[0x16] << 4) | (z[0x15] >> 4)) & 255
    p = (mul(vy16, z[0x72]) - mul(vx16, z[0x73])) & 0xFFFF
    p = s16(p) >> 2
    z[0x1f] = p & 255; z[0x20] = (p >> 8) & 255
    return dict(centreX=z[9] << 16 | z[8] << 8 | z[7], centreY=z[0xc] << 16 | z[0xb] << 8 | z[0xa],
                vx=z[0x14] << 16 | z[0x13] << 8 | z[0x12], vy=z[0x16] << 8 | z[0x15], rod=z[0x1d] << 8 | z[0x1c],
                av=z[0x20] << 16 | z[0x1f] << 8 | z[0x1e])
