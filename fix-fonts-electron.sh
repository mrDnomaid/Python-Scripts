#!/bin/bash
wget http://security.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype6_2.8-0.2ubuntu2.1_amd64.deb
wget http://security.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype6_2.8-0.2ubuntu2.1_i386.deb

sudo dpkg --force-all -i libfreetype6_2.8-0.2ubuntu2.1_i386.deb
sudo dpgk --force-all -i libfreetype6_2.8-0.2ubuntu2.1_amd64.deb

# Thanks to this reddit comment for the fix: https://www.reddit.com/r/discordapp/comments/7w9c5f/fonts_are_really_screwed_up_on_linux/du5sjxz/
