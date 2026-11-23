"""Emulate the in-game SFX driver ($9B58, called from the 50 Hz raster IRQ) for each trigger routine and
dump per-frame SID register states -> re/data/sounds.json (frames section)."""
import json, sys, os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))
from cpu6502 import CPU
ROOT = os.path.join(os.path.dirname(__file__), '..', '..')
base = bytearray(open(ROOT + '/re/game_running.bin', 'rb').read())

def call(cpu, addr, limit=200000):
    cpu.sp = 0xf0
    cpu.push(0xff); cpu.push(0xef)          # return to $FFF0
    cpu.pc = addr
    n = 0
    while cpu.pc != 0xfff0 and n < limit:
        cpu.step(); n += 1

def voice(m, v):
    b = 0xd400 + 7 * v
    return dict(freq=m[b] | m[b+1] << 8, pw=(m[b+2] | m[b+3] << 8) & 0xfff, ctrl=m[b+4], ad=m[b+5], sr=m[b+6])

def trace(trigger_calls, frames, retrigger_every=None, retrigger_for=0):
    m = bytearray(base)
    cpu = CPU(m)
    m[0x63] = 0; m[0xa2] = 0
    for a in range(0x9b45, 0x9b4b): m[a] = 0        # all SFX timers idle
    for a in range(0xd400, 0xd419): m[a] = 0
    m[0x9b55] = 0x80; m[0x9b56] = 0x40               # voice ctrl mirrors: gates off
    writes = []
    cpu.write_hook = lambda a, v: (writes.append((a, v)) if 0xd400 <= a < 0xd419 else None) and False
    out = []
    for f in range(frames):
        writes.clear()
        if f == 0 or (retrigger_every and f % retrigger_every == 0 and f < retrigger_for):
            for t in trigger_calls: call(cpu, t)
        call(cpu, 0x9b58)
        gates = [[v for a, v in writes if a == 0xd404 + 7 * k] for k in range(3)]
        out.append(dict(frame=f, v1=voice(m, 0), v2=voice(m, 1), v3=voice(m, 2),
                        filt_cut=(m[0xd415] & 7) | m[0xd416] << 3, filt_route_res=m[0xd417], mode_vol=m[0xd418],
                        ctrl_writes=[[hex(x) for x in g] for g in gates]))
    return out

EFFECTS = {
  'player_fire':   dict(trig=[0x9d3d], frames=30, desc='RETURN fire ($AA88 -> $9D3D), voice 2'),
  'gun_fire':      dict(trig=[0x9d85], frames=10, desc='limpet gun shot ($8759 -> $9D85), voice 2'),
  'explosion':     dict(trig=[0x9c94], frames=60, desc='any explosion ($9EF5 -> $9C94): object destroyed, reactor hit spark, ship death; voice 1'),
  'thrust_single': dict(trig=[0x9ccf], frames=14, desc='one thrust trigger ($95E3 -> $9CCF), voice 1'),
  'thrust_held':   dict(trig=[0x9ccf], frames=40, every=2, until=30, desc='thrust held: game re-triggers each game tick (~every 1.5 IRQ frames); simulated every 2 frames for 30 frames'),
  'shield_held':   dict(trig=[0x9d07], frames=50, every=3, until=30, desc='shield/tractor held ($97D9 -> $9D07, only on game ticks where ($1A&2)!=0); simulated every 3 frames for 30 frames'),
  'ping':          dict(trig=[0x9c75], frames=20, desc='voice-3 ping ($9C75): countdown tick ($9DD1, once per countdown digit)'),
  'fuel_or_pod_pickup': dict(trig=[0x9dc4], frames=30, desc='$9DC4 = ping now + second ping 9 IRQ frames later ($9B4A=9): fuel cell emptied, pod attached'),
}
if __name__ == '__main__':
    res = {}
    for k, e in EFFECTS.items():
        res[k] = dict(description=e['desc'], frames=trace(e['trig'], e['frames'], e.get('every'), e.get('until', 0)))
    json.dump(res, open(ROOT + '/re/data/sounds_frames.json', 'w'), indent=0)
    for k, v in res.items():
        print(k)
        for fr in v['frames'][:12]:
            print('  ', fr['frame'], 'v1', fr['v1'], 'v2', fr['v2'], 'v3', fr['v3'], fr['ctrl_writes'], hex(fr['filt_route_res']))
