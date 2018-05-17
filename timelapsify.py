# dnomaid.co.uk 2018

import os
import sys
from random import randint

#framerate = 25
#width = 2160
folder = 'timelapsify-temp'
rand = randint(1000000, 9999999)
framerate = sys.argv[1]
width = sys.argv[2]
filetype = sys.argv[3]

#if str(sys.argv[1]).isdigit()
#	framerate = sys.argv[1]

#if str(sys.argv[1]).isdigit()
#	width = sys.argv[2]

print("         88                                  88                                      88     ad88\n  ,d     \"\"                                  88                                      \"\"    d8\"\n  88                                         88                                            88\nMM88MMM  88  88,dPYba,,adPYba,    ,adPPYba,  88  ,adPPYYba,  8b,dPPYba,   ,adPPYba,  88  MM88MMM  8b       d8     8b,dPPYba,   8b       d8\n  88     88  88P'   \"88\"    \"8a  a8P_____88  88  \"\"     `Y8  88P'    \"8a  I8[    \"\"  88    88     `8b     d8'     88P'    \"8a  `8b     d8'\n  88     88  88      88      88  8PP\"\"\"\"\"\"\"  88  ,adPPPPP88  88       d8   `\"Y8ba,   88    88      `8b   d8'      88       d8   `8b   d8'\n  88,    88  88      88      88  \"8b,   ,aa  88  88,    ,88  88b,   ,a8\"  aa    ]8I  88    88       `8b,d8'  888  88b,   ,a8\"    `8b,d8'\n  \"Y888  88  88      88      88   `\"Ybbd8\"'  88  `\"8bbdP\"Y8  88`YbbdP\"'   `\"YbbdP\"'  88    88         Y88'   888  88`YbbdP\"'       Y88'\n                                                             88                                       d8'         88               d8'\n    A dnomaid.co.uk thing                                    88                                      d8'          88              d8'\n\n")

print('You are making a timelapse with a framerate of "' + str(framerate) + '" and a width of "' + str(width) + '" using files with the filetype "' + filetype + '"')
print('\nIf this is wrong, re-run the script with the following syntax:')
print('timelapsify.py FRAMERATE WIDTH FILETYPE (example: timelapsify.py 25 1920 JPG')
#print('\nPress enter to continue or CTRL+C to exit')
con = raw_input('\nPress enter to continue or CTRL+C to exit')

#os.system('clear')
print('\n\n=====\n\n')

print('Making sure you have everything we need installed')
print('Command to be ran: [sudo apt-get install ffmpeg imagemagick]')
os.system('sudo apt-get install ffmpeg imagemagick > /dev/null')

print('\n>Creating temp folder')
os.system('mkdir ' + folder)
os.system('mkdir ' + folder + '/ffmpeg')

print('\n>>Copying existing images for modification')
os.system('cp *.' + filetype + ' ' + folder + '/')

print('\n>>>Resizing images using mogrify')
os.system('mogrify ' + folder + '/* ' + str(width))

print('\n>>>>Encoding the files using ffmpeg')
outfile = 'timelapsify-' + str(framerate) + '-' + str(width) + '-' + str(rand)  + '.mp4'
os.system("ffmpeg -loglevel error -hide_banner -nostats -r " + framerate + " -pattern_type glob -i '*." + filetype + "' -c:v copy -c:v libx264 " + folder + "/ffmpeg/" + outfile)

print('\n>>>>>Moving the output videos')
os.system('mv ' + folder + '/ffmpeg/*mp4 .')

print('\n>>>>>>Deleting temp folder')
os.system('rm -r ' + folder)

print('\n\n=====\n\n')

print('Assuming no errors were found above, you can find your timelapse at: ' + outfile)
