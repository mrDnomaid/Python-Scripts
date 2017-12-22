# PyCmd
# dnomaid.co.uk 2017

import os

print('PyCmd\n')

def prompt():
    cmd = raw_input('$ ')

    if (cmd == 'exit'):
        quit()

    if (not cmd):
        print('Might be a nice idea if you actually type something mate')

    try:
        os.system(cmd)
    except:
        pass

    prompt()

prompt()
