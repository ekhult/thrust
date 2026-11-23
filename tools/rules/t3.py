from h import *
c = start_game(extra=50)
m=c.cpu.m
print('timer latch', hex(c.timer_latch))
s=[]
for i in range(200):
    c.run_frame(); s.append(m[0x19])
d=[(s[i]-s[i-1])&255 for i in range(1,len(s))]
print(d)
print('loops per 200 frames', (s[-1]-s[0])&255, sum(d))
