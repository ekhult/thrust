"""Simulate collisions by poking $D01F (the harness has no VIC collision emulation) and log the death sequence."""
from h import *
import sys
which = int(sys.argv[1], 16)       # $80 = ship-background, $40 = pod-background
pod = len(sys.argv) > 2
c = boot(); m = c.cpu.m
for f in range(60): c.run_frame()
if pod:
    m[0x22] = 0xFF; m[0xB520] = 0xFF
for f in range(20): c.run_frame()
rows = []
it = Iter(c, lambda c: rows.append((c.frame, m[0x19], 'p22=%02x p44=%02x p42=%02x p43=%02x p54=%02x p2A=%02x p2B=%02x p18=%02x D015=%02x lives=%s' % (m[0x22], m[0x44], m[0x42], m[0x43], m[0x54], m[0x2a], m[0x2b], m[0x18], m[0xd015], m[0x9403]), ((m[0xc]<<8|m[0xb]), m[9]), (m[0x16]^0x80)-0x80+m[0x15]/256)))
for f in range(300):
    if f == 10: m[0xd01f] = which
    if f == 11: m[0xd01f] = 0
    c.run_frame(trace=it.tr)
last = None
for r in rows:
    if r[2] != last: print(r[0], r[1], r[2], r[3], r[4])
    last = r[2]
