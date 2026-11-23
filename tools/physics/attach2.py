"""Capture the exact inputs/outputs of the pod-attach routine ($995F..$9AAE) and compare with model.attach()."""
from h import *
import model
c = boot(); m = c.cpu.m
for f in range(80): c.run_frame()
m[0x09] = 141; m[0x08] = 0; m[0x07] = 0; m[0x0c] = 440 >> 8; m[0x0b] = 440 & 255; m[0x0a] = 0
for a in range(0x12, 0x17): m[a] = 0
cap = {}
def tr(pc):
    if pc == 0x995F: cap['in'] = bytes(m[0:0x100])
    if pc == 0x9AAB: cap['out'] = bytes(m[0:0x100])
import sys
ang = int(sys.argv[1]) if len(sys.argv) > 1 else 0
side = int(sys.argv[2]) if len(sys.argv) > 2 else 0
for f in range(200):
    c.keys = {'SPACE'}
    if f >= 40: c.keys.add('LSHIFT')
    if 40 <= f < 40 + side: c.keys.add('S')
    c.run_frame(trace=tr)
    if 'out' in cap: break
i, o = cap['in'], cap['out']
print('in : ship X %02x.%02x Y %02x%02x.%02x  pod X %02x%02x Y %02x%02x  v %02x%02x%02x %02x%02x' % (i[0x33], i[0x32], i[0x30], i[0x2f], i[0x2e], i[0x65], i[0x64], i[0x67], i[0x66], i[0x14], i[0x13], i[0x12], i[0x16], i[0x15]))
print('out: centre X %02x%02x%02x Y %02x%02x%02x v %02x%02x%02x %02x%02x rod %02x%02x av %02x%02x%02x' % (o[9], o[8], o[7], o[0xc], o[0xb], o[0xa], o[0x14], o[0x13], o[0x12], o[0x16], o[0x15], o[0x1d], o[0x1c], o[0x20], o[0x1f], o[0x1e]))
r = model.attach(i)
print('model:', {k: (hex(v) if isinstance(v, int) else v) for k, v in r.items()})
