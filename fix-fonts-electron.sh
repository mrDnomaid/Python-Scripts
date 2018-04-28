#!/bin/bash
echo 'Downloading DEB files from Ubuntu pool'
wget http://security.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype6_2.8-0.2ubuntu2.1_amd64.deb
wget http://security.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype6_2.8-0.2ubuntu2.1_i386.deb

echo 'Force installing them over older/newer versions'
sudo dpkg --force-all -i libfreetype6_2.8-0.2ubuntu2.1_i386.deb
sudo dpgk --force-all -i libfreetype6_2.8-0.2ubuntu2.1_amd64.deb

echo 'Deleting DEB files now they\'re installed'
rm libfreetype6_2.8-0.2ubuntu2.1_i386.deb
rm libfreetype6_2.8-0.2ubuntu2.1_amd64.deb

echo 'Done!'
echo ''
echo 'Thanks to this reddit comment for the fix that I modified a bit:'
echo 'https://www.reddit.com/r/discordapp/comments/7w9c5f/fonts_are_really_screwed_up_on_linux/du5sjxz/'
