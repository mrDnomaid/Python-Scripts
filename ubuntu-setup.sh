#!/bin/bash

####
# Some things I run after Ubuntu installs on new devices
####

clear

if [[ $EUID -ne 0 ]]; then
   echo 'Please run as root'
   exit 1
fi

echo 'dno-install'
echo ''
echo ''

# Create temp folder
mkdir /tmp/dno-install/

# Make sure everything is up to date
apt update
apt upgrade --yes --force-yes


####
# Install some frequently used programs/utilities
####

# Install command line tools
apt install nano git curl wget ffmpeg htop sed youtube-dl rtv software-properties-common python-software-properties cowsay figlet --yes --force-yes

# Neofetch
add-apt-repository ppa:dawidd0811/neofetch --yes --force-yes
apt update
apt install neofetch --yes --force-yes

# Install GUI programs
apt install vlc firefox nautilus gnome-disks gparted gedit tilix --yes --force-yes

# Download and install Atom, Chrome
wget https://atom.io/download/deb -o /tmp/dno-install/atom.deb
apt install /tmp/dno-install/atom.deb --yes --force-yes

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /tmp/dno-install/chrome.deb
apt install /tmp/dno-install/chrome.deb --yes --force-yes


# Install Bash-It
git clone --depth=1 https://github.com/Bash-it/bash-it.git /home/$USER/.bash_it
bash /home/$USER/.bash_it/install.sh
# Change Bash-It theme
sed -i 's/bobby/powerline-plain/g' /home/$USER/.bashrc


# Custom aliases
# echo '\n' >> /home/$USER/.bashrc
# echo 'alias ytdl-mp4="youtube-dl -f \'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best\' --verbose"' >> /home/$USER/.bashrc
# echo 'alias ytdl-mp3="youtube-dl -f \'bestaudio[ext=mp3]/best[ext=mp3]/best\' --verbose"' >> /home/$USER/.bashrc

# Delete temp folder
rm -rf /tmp/dno-install
rm -f *deb*

clear
echo 'Done!'
