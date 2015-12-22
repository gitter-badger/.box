#!/usr/bin/env bash

#test if aptitude exists and default to using that if possible
if command -v aptitude >/dev/null 2>&1 ; then
  pm="aptitude"
else
  pm="apt-get"
fi
info -e "Using $pm for package installation\n"

# Install build tools

action "Update apt cache"
sudo $pm update

action "Installing build tools"
sudo $pm -y install \
  autoconf \
  automake \
  bison \
  build-essential \
  clang \
  curl \
	git \
	gitk \
  libxslt1.1 \
  libssl-dev \
  libxslt1-dev \
  libxml2 \
  libxml2-dev \
  libffi-dev \
  libyaml-dev \
  libxslt-dev \
  libc6-dev \
  libreadline-dev \
  libcurl4-openssl-dev \
  libtool \
  openssl \
  xclip \
  zlib1g \
  zlib1g-dev \
	wget
ok

action "Installing Mutate"
sudo $pm install -y \
  qt5-qmake \
  qt5-default \
  libgtk2.0-dev \
  libqt5x11extras5-dev \
  libboost-regex-dev

git clone https://github.com/qdore/Mutate.git
cd Mutate/src
qmake
make

sudo make install
cd ..
sudo cp info/mutate.png /usr/share/icons
sudo cp info/Mutate.desktop /usr/share/applications
mkdir -p ~/.config/Mutate
cp -R config/* ~/.config/Mutate
chmod -R a+x ~/.config/Mutate/scripts
chmod -R a+w ~/.config/Mutate
sed -i "s|{home}|$HOME|g" ~/.config/Mutate/config.ini
rm -rf Mutate
ok

