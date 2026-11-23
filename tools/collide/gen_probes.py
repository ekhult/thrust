"""Generate collision probe points near terrain edges and objects for every level."""
import json, os, random
L = json.load(open(os.path.join(os.path.dirname(__file__), '..', '..', 're', 'data', 'levels.json')))['levels']
random.seed(1)
for lv in range(6):
    d = L[lv]; spans = d['terrain']['open_spans']; first = d['first_terrain_row']; h = d['height']
    pts = set()
    while len(pts) < 120:
        y = random.randint(first - 5, h - 12)
        l, r = spans[y]
        if r - l < 10: continue
        side = random.random()
        if side < 0.4: x = l + random.randint(-3, 2)
        elif side < 0.8: x = r - 8 + random.randint(-2, 3)
        else: x = random.randint(l, r - 8)
        # vertical nudge so floors/ceilings get hit too
        y += random.choice([0, 0, -3, 3, 6, -6])
        if 0 <= x <= 247: pts.add((lv, x, y, random.randint(0, 31)))
    for o in d['objects']:
        for _ in range(7):
            pts.add((lv, max(0, o['x'] + random.randint(-6, 4)), o['y'] + random.randint(-2, 14), random.randint(0, 31)))
    pts = sorted(pts, key=lambda p: (p[2] // 20, p[1] if (p[2] // 20) % 2 == 0 else -p[1]))
    with open(f'probes_{lv}.txt', 'w') as f:
        for p in pts: f.write(' '.join(map(str, p)) + '\n')
    # pod-attached probes: same kind of points with a random rod angle, about a third of the count
    pod = [p + (random.randint(0, 31),) for p in pts if random.random() < 0.35]
    with open(f'podprobes_{lv}.txt', 'w') as f:
        for p in pod: f.write(' '.join(map(str, p)) + '\n')
    print(lv, len(pts))
