from h import *
c = boot(); m = c.cpu.m
for f in range(80): c.run_frame()
m[0x09] = 141; m[0x08] = 0; m[0x07] = 0; m[0x0c] = 440 >> 8; m[0x0b] = 440 & 255; m[0x0a] = 0
for a in range(0x12, 0x17): m[a] = 0
done = [0]
def tr(pc):
    if pc == 0x99EC: print('cand rod %02x%02x' % (m[0x1d], m[0x1c]), end=' ')
    if pc == 0x99FB: print('ax %02x ay %02x t %02x %02x' % (m[0x24], m[0x26], m[0x75], m[0x77]), end=' ')
    if pc == 0x9A18: print('d %02x' % c.cpu.a)
    if pc == 0x9AAB: done[0] = 1
for f in range(200):
    c.keys = {'SPACE'}
    if f >= 40: c.keys.add('LSHIFT')
    c.run_frame(trace=tr)
    if done[0]: break
