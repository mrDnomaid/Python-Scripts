import os
import random

os.system('clear')
oldhostname = os.popen('hostname').read().rstrip()

print('Please make sure you are running this tool as root on a Linux system.')
print('To exit, simply push Ctrl+C at any time.')
print(' ')
print('Press (almost) any key to continue.')
gopastchecks = raw_input('')

os.system('clear')

print('What do you want the new hostname to be?')
newhostname = raw_input('>> ')

os.system('clear')

# I nicked this from StackOverflow
# Cheers, Jack.
# https://stackoverflow.com/a/17141572/6325767

# Read in the file
with open('/etc/hosts', 'r') as file :
  filedata = file.read()

# Replace the target string
filedata = filedata.replace(oldhostname, newhostname)

# Write the file out again
with open('/etc/hosts', 'w') as file:
  file.write(filedata)

# Read in the file
with open('/etc/hostname', 'r') as file :
  filedata = file.read()

# Replace the target string
filedata = filedata.replace(oldhostname, newhostname)

# Write the file out again
with open('/etc/hostname', 'w') as file:
  file.write(filedata)

print('Old hostname:')
print(oldhostname)
print(' ')
print('Changed to:')
print(newhostname)
print(' ')
print('You may need to reboot for the change to fully take effect.')
