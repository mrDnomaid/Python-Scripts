wget http://security.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype6_2.8-0.2ubuntu2.1_amd64.deb
wget http://security.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype6_2.8-0.2ubuntu2.1_i386.deb

sudo dpkg --force-all -i libfreetype6_2.8-0.2ubuntu2.1_i386.deb
sudo dpgk --force-all -i libfreetype6_2.8-0.2ubuntu2.1_amd64.deb

