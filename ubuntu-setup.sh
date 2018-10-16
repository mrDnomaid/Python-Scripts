#!/bin/bash

###
# Install all the software I need
###

sudo apt-get update

echo '[installing] Internet'
sudo apt-get install firefox thunderbird deluge

echo '[installing] Terminal Utilities'
sudo apt-get install tilix neofetch git youtube-dl beep cowsay figlet lolcat

echo '[installing] Specialist'
sudo apt-get install darktable hugin kdenlive gimp gthumb

echo '[installing] Filesystem Utils'
sudo apt-get install exfat-fuse exfat-utils cifs cifs-utils

echo '[doing] Creating temporary folders'
sudo mkdir /tmp/pkg-install/

echo '[doing] Installing packages not available in default repos'

echo '[downloading] Atom'
sudo wget -O '/tmp/pkg-install/atom.deb' https://atom.io/download/deb
echo '[installing] Atom'
sudo dpkg -i /tmp/pkg-install/atom.deb

echo '[downloading] GitKraken'
sudo wget -O '/tmp/pkg-install/gitk.deb' https://www.gitkraken.com/download/linux-deb
echo '[installing] GitKraken'
sudo dpkg -i /tmp/pkg-install/gitk.deb

echo '[downloading] Discord'
sudo wget -O '/tmp/pkg-install/discord.deb' https://discordapp.com/api/download/canary?platform=linux&format=deb
echo '[installing] Discord'
sudo dpkg -i /tmp/pkg-install/discord.deb

echo '[downloading] GPMDP'
sudo wget -O '/tmp/pkg-install/music.deb' https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v4.5.0/google-play-music-desktop-player_4.5.0_amd64.deb
echo '[installing] GPMDP'
sudo dpkg -i /tmp/pkg-install/music.deb

echo '[downloading] Keybase'
sudo wget -O '/tmp/pkg-install/keybase.deb' https://prerelease.keybase.io/keybase_amd64.deb
echo '[installing] Keybase'
sudo dpkg -i /tmp/pkg-install/keybase.deb

echo '[installing] Dependancies for packages installed with DPKG'
sudo apt-get -f install

echo '[doing] Installing packages from non-default repos'

echo '[adding] Etcher repo'
echo "deb https://dl.bintray.com/resin-io/debian stable etcher" | sudo tee /etc/apt/sources.list.d/etcher.list
echo '[trusting] Bintray key'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61

echo '[adding] Etcher repo'
echo "deb https://dl.bintray.com/resin-io/debian stable etcher" | sudo tee /etc/apt/sources.list.d/etcher.list
echo '[trusting] Bintray key'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
echo '[doing] Updating package lists to install Etcher'
echo '[installing] Etcher'
sudo apt-get install etcher-electron

echo ''
echo ''
echo '##### Done! (Hopefully) #####'
echo ''
echo ''
