from h import *
c = boot()
for f in range(400):
    c.run_frame()
    if f in (50,150,250,399): shot(c, f'/tmp/claude-501/../../private/tmp/x{f}.png') if False else shot(c, f'out/title_{f}.png')
