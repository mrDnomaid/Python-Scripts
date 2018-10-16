# PyCmd
# dnomaid.co.uk 2017

import os

print('PyCmd\n')

def prompt():
    cmd = raw_input('$> ')

    if (cmd == 'exit'):
        quit()

    if (not cmd):
        print('Might be a nice idea if you actually type something mate')
        # raise Exception('No Command Entered')

    try:
        os.system(cmd)
    except:
        # raise Exception('Error Running Command')
        pass

    prompt()

prompt()
