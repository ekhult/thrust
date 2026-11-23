"""Extract the 5-row text font ($8E52, planar 5x37) and the status-bar charset ($5800) -> re/data/font.png/json."""
import json, os, sys
from h import ROOT, save_png, boot, start_game
from c64 import C64
m = open(ROOT + '/re/game_running.bin', 'rb').read()
OUT = ROOT + '/re/data/'
N = 37
glyph_chars = '.' + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' + '0123456789'
glyphs = []
for i in range(N):
    glyphs.append([m[0x8e52 + i + N * r] for r in range(5)])
# char -> glyph mapping implemented by $8F4E
def glyph_index(ch):
    c = ord(ch)
    if c == 0x20: return 'space'           # clears 5 bytes, advances
    if 0x30 <= c < 0x3a: return c - 0x15 - 0x00 - 0x00 - 0x00 if False else c - 0x15
    c2 = c | 0x20
    if 0x61 <= c2 < 0x7b: return c2 - 0x60
    return 0
mapping = {ch: glyph_index(ch) for ch in 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 .'}
# PNG of the text font: hires interpretation, 1 px gap, scale 4 ; and multicolour (as displayed) interpretation
W = N * 9
img = [[(0, 0, 0)] * W for _ in range(5 * 2 + 3)]
for i, g in enumerate(glyphs):
    for r, b in enumerate(g):
        for x in range(8):
            if b & (0x80 >> x): img[r][i * 9 + x] = (255, 255, 255)
        # multicolour: pairs; 01 -> green(5) 10 -> black 11 -> light green? show pair code as greys
        for p in range(4):
            v = (b >> (6 - 2 * p)) & 3
            col = [(0, 0, 0), (85, 160, 73), (120, 120, 120), (255, 255, 255)][v]
            img[r + 7][i * 9 + 2 * p] = col; img[r + 7][i * 9 + 2 * p + 1] = col
save_png(img, OUT + 'font.png', scale=4)
# status-bar charset at $5800 (taken from a live game frame so the status values are drawn in)
c = start_game(extra=40)
cm = c.cpu.m
charset = bytes(cm[0x5800:0x6000])
rows = 16
img2 = [[(0, 0, 0)] * (32 * 9) for _ in range(rows * 9)]
for ch in range(256):
    cx, cy = (ch % 32) * 9, (ch // 32) * 9
    for r in range(8):
        b = charset[ch * 8 + r]
        for x in range(8):
            if b & (0x80 >> x): img2[cy + r][cx + x] = (255, 255, 255)
save_png(img2, OUT + 'charset_5800.png', scale=3)
# status bar crop as displayed (rows 0..1 of the text screen = 16 px)
full = c.render()
save_png([row[:] for row in full[0:24]], OUT + 'statusbar.png', scale=3)
js = {
  'text_font': {
    'address': '$8E52', 'layout': 'planar: row r of glyph i at $8E52 + i + 37*r, 5 rows, 1 byte (8 px) wide, advance 8 bytes (= one bitmap cell) per char',
    'glyph_order': glyph_chars,
    'glyphs_hex': {glyph_chars[i]: ''.join('%02X' % b for b in g) for i, g in enumerate(glyphs)},
    'char_to_glyph': mapping,
    'notes': [
      'Printer $8F4E: A=char. $20 -> blank cell (5 bytes cleared), $7F -> backspace, $07/<$20 ignored, 0-9 -> glyph 27-36, A-Z/a-z -> glyph 1-26, anything else -> glyph 0 (".").',
      'Glyph bytes are written straight into a multicolour bitmap (or into the $5800 charset for the status bar), so each 2-bit pair is a colour index: 00 bg, 01 = screen-byte high nibble, 10 = screen-byte low nibble, 11 = colour RAM.',
      'Text rows occupy pixel rows 0-4 of an 8-px cell; the cursor $FB/$FC is a bitmap address (record bytes x,y = address lo,hi).'],
  },
  'charset_5800': {
    'address': '$5800-$5FFF', 'hex': charset.hex().upper(),
    'notes': ['Chars $00-$4F form the 2-row status bar picture (screen $5C00/$5400 rows 0-1 hold 00..4F in order).',
              'FUEL/LIVES/SCORE values and the countdown digits are drawn INTO these chars with the text font ($59xx/$5Axx addresses).',
              'Status bar is multicolour text mode: colour RAM row0 = $F (cols 0-4,10-16,22-29,35-39) / $5 (cols 5-9,17-21,30-34), row1 = $7.'],
  },
}
json.dump(js, open(OUT + 'font.json', 'w'), indent=1)
print('ok')
