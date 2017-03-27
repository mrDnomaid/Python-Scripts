import os

os.system('clear')

print('0 ) Checks')
print(' ')
print('Please make sure you are running this tool as root on a Linux system.')
print('To exit, simply push Ctrl+C at any time.')
print(' ')
print('Press (almost) any key to continue.')
gopastchecks = raw_input('')

os.system('clear')

print('1 ) SMB Server/Share')
print(' ')
print('Example: \\\expensivenas\documents')
server = raw_input('>> ')

os.system('clear')

print('2 ) Mount Point')
print(' ')
print('Example: /media/nas-documents')
print('/!\ The folder name here will be what the share shows up as')
mount_point = raw_input('>> ')

os.system('clear')

print('3 ) Credentials File')
print(' ')
print('The file should look similar to this:')
print(' ')
print('username=yourusername')
print('password=yourpassword')
print(' ')
print('It\'s rather insecure, but I don\'t know a better way to do it.')
print(' ')
print('Example: /home/you/.servercreds')
cred_file = raw_input('>> ')

os.system('clear')

print('4 ) GID')
print(' ')
print('Example: 1234')
print('[i] To find your GID, follow the steps here: http://bit.ly/GID-UID')
gid = raw_input('>> ')

os.system('clear')

print('5 ) UID')
print(' ')
print('Example: 4321')
print('[i] To find your UID, follow the steps here: http://bit.ly/GID-UID')
uid = raw_input('>> ')

os.system('clear')

print server
print mount_point
print cred_file
print gid
print uid

print(' ')

print('Is this OK?')
print('Enter to continue, Ctrl+C to cancel and exit.')
isok = raw_input(' ')

os.system('clear')

print('6 ) Doing the thing!')
print('')
print('Opening file')
# This is probably the worst way to do this, but it works so I don't care
fstab = open('/etc/fstab', 'a')
print('Writing newline')
fstab.write('\n')
print('Writing server/share')
fstab.write(server)
print('Writing a space')
fstab.write(' ')
print('Creating the mount point folder in case it doesn\'t exist')
os.makedirs(mount_point)
print('Writing the mount point')
fstab.write(mount_point)
print('Writing the filesystem type')
fstab.write(' cifs ')
print('Writing credentials file prefix')
fstab.write('credentials=')
print('Writing credentials file location')
fstab.write(cred_file)
print('Writing charset')
fstab.write(',iocharset=utf8,gid=')
print('Writing GID')
fstab.write(gid)
print('Writing UID prefix')
fstab.write(',uid=')
print('Writing UID')
fstab.write(uid)
print('Writing final bits')
fstab.write(',file_mode=0777,dir_mode=0777 0 0')
print('Attempting to mount all drives')
os.system('mount -a')
print(' ')
print('Fingers crossed, the file should be updated!')
print('You may need to run "sudo mount -a" manually to access the share.')
