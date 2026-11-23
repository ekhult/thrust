"""Builds the remake's resource files from the reverse-engineered data in re/."""
import json, os
ROOT = os.path.join(os.path.dirname(__file__), '..', '..')
RE = os.path.join(ROOT, 're')
OUT = os.path.join(ROOT, 'ThrustMac', 'Sources', 'Thrust', 'Resources')
ram = open(os.path.join(RE, 'game_running.bin'), 'rb').read()
L = json.load(open(os.path.join(RE, 'data', 'levels.json')))
TYPES = {'limpet_gun': None, 'fuel': 4, 'pod': 5, 'reactor': 6}
levels = []
for lv in L['levels']:
    spans = []
    for l, r in lv['terrain']['open_spans']:
        spans += [l, r]
    objs = []
    for o in lv['objects']:
        t = o['type_id'] if 'type_id' in o else None
        objs.append({'type': o['type_id'], 'x': o['x'], 'y': o['y'], 'flags': o['flags']})
    c = lv['colours']
    levels.append({
        'height': lv['height'], 'spans': spans, 'gravity': lv['gravity'],
        'colours': {k: c[k] for k in ('terrain', 'pod', 'status_labels', 'gun', 'ship_shield')},
        'restart': lv['restart_points'], 'objects': objs,
    })
json.dump({'levels': levels}, open(os.path.join(OUT, 'levels.json'), 'w'), separators=(',', ':'))
open(os.path.join(OUT, 'sprites.bin'), 'wb').write(ram[0x4000:0x4000 + 64 * 49])
# original RAM images: the game image drives the SFX driver ($9B58) and supplies charset/font;
# the pristine start image holds Rob Hubbard's title music player ($2000) at the song start.
open(os.path.join(OUT, 'c64_game.bin'), 'wb').write(ram)
open(os.path.join(OUT, 'c64_start.bin'), 'wb').write(open(os.path.join(RE, 'mem_at_start.bin'), 'rb').read())
print('levels', [ (l['height'], len(l['objects'])) for l in levels])
