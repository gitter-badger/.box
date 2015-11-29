#!/usr/bin/env bash

#test if aptitude exists and default to using that if possible
if command -v aptitude >/dev/null 2>&1 ; then
  pm="aptitude"
else
  pm="apt-get"
fi
echo -e "\nUsing $pm for package installation\n"

# Install build tools
echo -e "\n=> Installing build tools..."

sudo $pm update

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
  zlib1g \
  zlib1g-dev \
	wget
echo "==> done..."
