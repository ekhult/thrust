"""Minimal C64 harness around cpu6502: raster IRQ, CIA1 timer IRQ, keyboard matrix, VIC snapshot per line."""
import zlib, struct
from cpu6502 import CPU
from dis import M as OPS, SIZE

BASE = {'imp':2,'acc':2,'imm':2,'zp':3,'zpx':4,'zpy':4,'abs':4,'abx':4,'aby':4,'izx':6,'izy':5,'rel':3,'ind':5}
CYC = [2]*256
for op,(mn,md) in OPS.items():
    c = BASE[md]
    if mn in ('asl','lsr','rol','ror','inc','dec') and md != 'acc':
        c = {'zp':5,'zpx':6,'abs':6,'abx':7}[md]
    if mn in ('sta',) and md in ('abx','aby'): c = 5
    if mn in ('sta',) and md == 'izy': c = 6
    if mn in ('jsr','rts','rti'): c = 6
    if mn == 'jmp': c = 3 if md == 'abs' else 5
    if mn in ('pha','php'): c = 3
    if mn in ('pla','plp'): c = 4
    if mn == 'brk': c = 7
    CYC[op] = c

# keyboard matrix: key name -> (column(PA bit), row(PB bit))
KEYS = {
 'DEL':(0,0),'RETURN':(0,1),'RIGHT':(0,2),'F7':(0,3),'F1':(0,4),'F3':(0,5),'F5':(0,6),'DOWN':(0,7),
 '3':(1,0),'W':(1,1),'A':(1,2),'4':(1,3),'Z':(1,4),'S':(1,5),'E':(1,6),'LSHIFT':(1,7),
 '5':(2,0),'R':(2,1),'D':(2,2),'6':(2,3),'C':(2,4),'F':(2,5),'T':(2,6),'X':(2,7),
 '7':(3,0),'Y':(3,1),'G':(3,2),'8':(3,3),'B':(3,4),'H':(3,5),'U':(3,6),'V':(3,7),
 '9':(4,0),'I':(4,1),'J':(4,2),'0':(4,3),'M':(4,4),'K':(4,5),'O':(4,6),'N':(4,7),
 '+':(5,0),'P':(5,1),'L':(5,2),'-':(5,3),'.':(5,4),':':(5,5),'@':(5,6),',':(5,7),
 '£':(6,0),'*':(6,1),';':(6,2),'HOME':(6,3),'RSHIFT':(6,4),'=':(6,5),'^':(6,6),'/':(6,7),
 '1':(7,0),'LEFT':(7,1),'CTRL':(7,2),'2':(7,3),'SPACE':(7,4),'CBM':(7,5),'Q':(7,6),'STOP':(7,7),
}

VICREGS = (0x11, 0x16, 0x18, 0x20, 0x21, 0x22, 0x23, 0x15, 0x10, 0x17, 0x1b, 0x1c, 0x1d, 0x25, 0x26)

class C64:
    def __init__(self, ram):
        self.cpu = CPU(bytearray(ram))
        self.cpu.read_hook = self.rd
        self.cpu.write_hook = self.wr
        self.cyc = 0
        self.line = 0
        self.raster_cmp = 0
        self.d019 = 0
        self.d01a = 0
        self.dd00 = 0x3f
        self.pa = 0xff
        self.timer_latch = 0xffff
        self.timer = 0xffff
        self.timer_on = False
        self.cia_icr_mask = 0
        self.cia_icr = 0
        self.keys = set()
        self.frame = 0
        self.linestate = [None]*312
        self.sid_writes = []
        self.writes_watch = None
        self.rom_calls = []
        self.d01e = 0               # sprite-sprite collision latch
        self.d01f = 0               # sprite-background collision latch
        self.collide = True
        self.coll_log = None

    def rd(self, a):
        if 0xd000 <= a < 0xe000 and (self.cpu.m[1] & 3) != 0 and (self.cpu.m[1] & 4):
            if a == 0xd012: return self.line & 0xff
            if a == 0xd011: return (self.cpu.m[0xd011] & 0x7f) | ((self.line >> 1) & 0x80)
            if a == 0xd019: return self.d019 | (0x80 if self.d019 & self.d01a else 0)
            if a == 0xd01e:
                v = self.d01e; self.d01e = 0; return v
            if a == 0xd01f:
                v = self.d01f; self.d01f = 0; return v
            if a == 0xdc01:
                v = 0xff
                for k in self.keys:
                    col, row = KEYS[k]
                    if not (self.pa >> col) & 1: v &= ~(1 << row)
                return v & 0xff
            if a == 0xdc00:
                return self.pa & 0xff
            if a == 0xdc0d:
                v = self.cia_icr | (0x80 if self.cia_icr & self.cia_icr_mask else 0)
                self.cia_icr = 0
                return v
            if a == 0xdd00: return self.dd00
            if a == 0xd41b: return (self.cyc * 7) & 0xff   # osc3 random
            return self.cpu.m[a]
        return None

    def wr(self, a, v):
        if self.writes_watch and a in self.writes_watch:
            self.writes_watch[a].append((self.frame, self.cpu.pc, v))
        if 0xd000 <= a < 0xe000 and (self.cpu.m[1] & 3) != 0 and (self.cpu.m[1] & 4):
            if a == 0xd012: self.raster_cmp = (self.raster_cmp & 0x100) | v
            elif a == 0xd011: self.raster_cmp = (self.raster_cmp & 0xff) | ((v & 0x80) << 1); self.cpu.m[a] = v
            elif a == 0xd019: self.d019 &= ~v & 0xff
            elif a == 0xd01a: self.d01a = v & 0xf
            elif a == 0xdc00: self.pa = v
            elif a == 0xdc04: self.timer_latch = (self.timer_latch & 0xff00) | v
            elif a == 0xdc05: self.timer_latch = (self.timer_latch & 0xff) | v << 8
            elif a == 0xdc0e:
                self.timer_on = bool(v & 1)
                if v & 0x10: self.timer = self.timer_latch
            elif a == 0xdc0d:
                if v & 0x80: self.cia_icr_mask |= v & 0x7f
                else: self.cia_icr_mask &= ~v & 0x7f
            elif a == 0xdd00: self.dd00 = v
            elif 0xd400 <= a < 0xd420:
                self.sid_writes.append((self.frame, self.cyc, a & 0x1f, v)); self.cpu.m[a] = v
            else: self.cpu.m[a] = v
            return True
        self.cpu.m[a] = v & 0xff
        return True

    def snapshot_line(self):
        m = self.cpu.m
        self.linestate[self.line] = (bytes(m[0xd000:0xd030]), self.dd00)
        if self.collide:
            self.line_collisions(self.line)

    # ---------------- VIC collision detection ----------------
    _REV = [int(f'{b:08b}'[::-1], 2) for b in range(256)]

    def sprite_mask(self, s, r, regs, bank, scr):
        """Bit mask (bit index = VIC x coordinate) of sprite s on raster line r, or 0."""
        m = self.cpu.m
        y = regs[1 + 2 * s]
        dy = r - y - 1                      # sprite data starts on the line after the Y match
        if (regs[0x17] >> s) & 1: dy //= 2
        if not 0 <= dy < 21: return 0
        ptr = m[scr + 0x3f8 + s]
        a = bank + ptr * 64 + dy * 3
        bits = m[a] << 16 | m[a + 1] << 8 | m[a + 2]
        if not bits: return 0
        if (regs[0x1c] >> s) & 1:            # multicolour: any non-00 pair is foreground
            mc = 0
            for p in range(12):
                if (bits >> (22 - 2 * p)) & 3: mc |= 3 << (22 - 2 * p)
            bits = mc
        x = regs[2 * s] | (((regs[0x10] >> s) & 1) << 8)
        mask = 0
        xexp = (regs[0x1d] >> s) & 1
        for i in range(24):
            if bits & (0x800000 >> i):
                if xexp: mask |= 3 << (x + 2 * i)
                else: mask |= 1 << (x + i)
        return mask

    def background_mask(self, r, regs, bank):
        """Foreground (collision-relevant) graphics pixels of raster line r, bit index = VIC x."""
        m = self.cpu.m
        d011, d016, d018 = regs[0x11], regs[0x16], regs[0x18]
        if not d011 & 0x10: return 0
        g = r - 48 - (d011 & 7)
        if not 0 <= g < 200: return 0
        row, ln = g >> 3, g & 7
        bmm, mcm = d011 & 0x20, d016 & 0x10
        x0 = 24 + (d016 & 7)
        scr = bank + ((d018 >> 4) & 15) * 0x400
        mask = 0
        for col in range(40):
            if bmm:
                byte = m[bank + (0x2000 if d018 & 8 else 0) + row * 320 + col * 8 + ln]
                mc = mcm
            else:
                code = m[scr + row * 40 + col]
                byte = self.vram(bank, bank + ((d018 >> 1) & 7) * 0x800 + code * 8 + ln)
                mc = mcm and (m[0xd800 + row * 40 + col] & 8)
            if not byte: continue
            if mc:
                fg = 0
                for p in range(4):
                    if (byte >> (6 - 2 * p)) & 2: fg |= 3 << (6 - 2 * p)
                byte = fg
            mask |= self._REV[byte] << (x0 + col * 8)
        return mask

    def line_collisions(self, r):
        m = self.cpu.m
        regs = m[0xd000:0xd030]
        en = regs[0x15]
        if not en: return
        bank = (3 - (self.dd00 & 3)) * 0x4000
        scr = bank + ((regs[0x18] >> 4) & 15) * 0x400
        masks = {}
        for s in range(8):
            if (en >> s) & 1:
                mk = self.sprite_mask(s, r, regs, bank, scr)
                if mk: masks[s] = mk
        if not masks: return
        ss = list(masks.items())
        for i in range(len(ss)):
            for j in range(i + 1, len(ss)):
                if ss[i][1] & ss[j][1]:
                    self.d01e |= (1 << ss[i][0]) | (1 << ss[j][0])
                    if self.coll_log is not None: self.coll_log.append(('ss', r, ss[i][0], ss[j][0]))
        bg = self.background_mask(r, regs, bank)
        if bg:
            for s, mk in ss:
                if mk & bg:
                    self.d01f |= 1 << s
                    if self.coll_log is not None: self.coll_log.append(('bg', r, s, (mk & bg).bit_length() - 1))

    def irq(self):
        cpu = self.cpu
        if cpu.i: return False
        # KERNAL IRQ entry ($FF48): push PC,P then A,X,Y and JMP ($0314) when KERNAL is mapped
        cpu.push(cpu.pc >> 8); cpu.push(cpu.pc & 0xff); cpu.push(cpu.getp(0)); cpu.i = 1
        if cpu.m[1] & 2:
            cpu.push(cpu.a); cpu.push(cpu.x); cpu.push(cpu.y)
            cpu.pc = cpu.m[0x314] | cpu.m[0x315] << 8
        else:
            cpu.pc = cpu.m[0xfffe] | cpu.m[0xffff] << 8
        self.cyc += 7
        return True

    def run_frame(self, trace=None):
        cpu = self.cpu
        m = cpu.m
        while True:
            pc = cpu.pc
            if trace is not None: trace(pc)
            if (pc >= 0xe000 and m[1] & 2) or (0xa000 <= pc < 0xc000 and m[1] & 3 == 3):
                self.rom_calls.append(pc)
                if pc == 0xffe4: cpu.a = 0
                lo = cpu.pull(); hi = cpu.pull(); cpu.pc = ((hi << 8 | lo) + 1) & 0xffff
                continue
            op = m[pc]
            cpu.step()
            c = CYC[op]
            self.cyc += c
            if self.timer_on:
                self.timer -= c
                if self.timer <= 0:
                    self.timer += self.timer_latch
                    self.cia_icr |= 1
            nl = (self.cyc // 63) % 312
            if nl != self.line:
                self.line = nl
                self.snapshot_line()
                if nl == self.raster_cmp:
                    self.d019 |= 1
                if nl == 0:
                    self.frame += 1
                    return
            if (self.d019 & self.d01a & 1) or (self.cia_icr & self.cia_icr_mask & 1):
                self.irq()

    # ---------------- VIC renderer ----------------
    PAL = [(0,0,0),(255,255,255),(136,57,50),(103,182,189),(139,63,150),(85,160,73),(64,49,141),(191,206,114),
           (139,84,41),(87,66,0),(184,105,98),(80,80,80),(120,120,120),(148,224,137),(120,105,196),(159,159,159)]

    def vram(self, bank, a):
        a = bank + (a & 0x3fff)
        if bank in (0x0000, 0x8000) and 0x1000 <= (a & 0x3fff) < 0x2000:
            return 0  # char ROM not available
        return self.cpu.m[a]

    def render(self):
        """Render 320x200 visible area using per-line register snapshots."""
        m = self.cpu.m
        img = [[(0,0,0)]*320 for _ in range(200)]
        P = self.PAL
        for y in range(200):
            rl = 51 + y
            st = self.linestate[rl] or (bytes(m[0xd000:0xd030]), self.dd00)
            regs, dd00 = st
            bank = (3 - (dd00 & 3)) * 0x4000
            d011, d016, d018 = regs[0x11], regs[0x16], regs[0x18]
            bg = [regs[0x21] & 15, regs[0x22] & 15, regs[0x23] & 15]
            scr = bank + ((d018 >> 4) & 15) * 0x400
            bmm = d011 & 0x20; mcm = d016 & 0x10; ecm = d011 & 0x40
            yscroll = d011 & 7; xscroll = d016 & 7
            row = (y - yscroll + 3) // 8 if True else 0
            ry = (y - yscroll + 3) % 8
            row = (y + 3 - yscroll) // 8
            if row < 0 or row > 24:
                continue
            line = img[y]
            for col in range(40):
                ci = row * 40 + col
                code = m[scr + ci]
                cram = m[0xd800 + ci] & 15
                if bmm:
                    bmp = bank + (0x2000 if d018 & 8 else 0)
                    bits = m[bmp + ci * 8 + ry]
                    if mcm:
                        cols = [bg[0], code >> 4, code & 15, cram]
                        for px in range(4):
                            c = P[cols[(bits >> (6 - px*2)) & 3]]
                            x = col*8 + px*2 + xscroll
                            if x < 320: line[x] = c
                            if x+1 < 320: line[x+1] = c
                    else:
                        for px in range(8):
                            c = P[(code >> 4) if bits & (0x80 >> px) else (code & 15)]
                            x = col*8+px+xscroll
                            if x < 320: line[x] = c
                else:
                    cb = bank + ((d018 >> 1) & 7) * 0x800
                    if ecm:
                        bits = self.vram(bank, cb + (code & 63) * 8 + ry); fg = cram; bgc = regs[0x21 + (code >> 6)] & 15
                        for px in range(8):
                            x = col*8+px+xscroll
                            if x < 320: line[x] = P[fg if bits & (0x80 >> px) else bgc]
                        continue
                    bits = self.vram(bank, cb + code * 8 + ry)
                    if mcm and cram & 8:
                        cols = [bg[0], bg[1], bg[2], cram & 7]
                        for px in range(4):
                            c = P[cols[(bits >> (6 - px*2)) & 3]]
                            x = col*8+px*2+xscroll
                            if x < 320: line[x] = c
                            if x+1 < 320: line[x+1] = c
                    else:
                        for px in range(8):
                            x = col*8+px+xscroll
                            if x < 320: line[x] = P[cram if bits & (0x80 >> px) else bg[0]]
        # sprites: use regs at the sprite's own Y line
        for y in range(200):
            rl = 51 + y
            for s in range(7, -1, -1):
                st = self.linestate[rl] or (bytes(m[0xd000:0xd030]), self.dd00)
                regs, dd00 = st
                if not (regs[0x15] >> s) & 1: continue
                sy = regs[1 + s*2]
                dy = rl - sy
                yexp = (regs[0x17] >> s) & 1
                if yexp: dy //= 2
                if not (0 <= dy < 21): continue
                bank = (3 - (dd00 & 3)) * 0x4000
                scr = bank + ((regs[0x18] >> 4) & 15) * 0x400
                ptr = m[scr + 0x3f8 + s]
                data = bank + ptr * 64 + dy * 3
                sx = regs[s*2] | (((regs[0x10] >> s) & 1) << 8)
                xexp = (regs[0x1d] >> s) & 1
                mc = (regs[0x1c] >> s) & 1
                col = regs[0x27 + s] & 15
                for bx in range(24):
                    byte = m[data + bx // 8]
                    if mc:
                        pair = (byte >> (6 - (bx % 8) // 2 * 2)) & 3
                        c = [None, regs[0x25] & 15, col, regs[0x26] & 15][pair]
                    else:
                        c = col if byte & (0x80 >> (bx % 8)) else None
                    if c is None: continue
                    for e in range(2 if xexp else 1):
                        x = sx - 24 + bx * (2 if xexp else 1) + e
                        if 0 <= x < 320: img[y][x] = P[c]
        return img

def save_png(img, path, scale=2):
    h = len(img); w = len(img[0])
    raw = bytearray()
    for row in img:
        for _ in range(scale):
            raw.append(0)
            for (r, g, b) in row:
                raw += bytes((r, g, b)) * scale
    def chunk(t, d):
        c = struct.pack('>I', len(d)) + t + d
        return c + struct.pack('>I', zlib.crc32(t + d) & 0xffffffff)
    png = b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>IIBBBBB', w*scale, h*scale, 8, 2, 0, 0, 0)) + chunk(b'IDAT', zlib.compress(bytes(raw), 6)) + chunk(b'IEND', b'')
    open(path, 'wb').write(png)
