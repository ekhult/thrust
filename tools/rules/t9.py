from h import *
c = start_game(extra=40)
m=c.cpu.m
m[0xa3]=200
hits=set()
watch={0x8740,0x8746,0x874a,0x874e,0x8752,0x8759,0x8778,0x85f3,0x87f8}
def tr(pc):
    if pc in watch: hits.add(pc)
for t in range(100):
    c.run_frame(trace=tr)
print(sorted(hex(h) for h in hits))
print(m[0x85], m[0x3d])
