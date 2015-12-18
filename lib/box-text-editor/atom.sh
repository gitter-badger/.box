#!/usr/bin/env bash
source "$_BOX_ROOT/lib/bash_functions.sh"

bot "Install Atom"

if [ "$NS_PLATFORM" == "darwin" ]; then
  require_cask atom
fi

if [ "$NS_PLATFORM" == "linux" ]; then
  # Currently only a 64-bit version is available.
  # The Linux version does not currently automatically update 
  # so you will need to repeat these steps to upgrade to future releases.
  wget https://github.com/atom/atom/releases/download/v1.3.2/atom-amd64.deb
  sudo dpkg --install atom-amd64.deb
  # Launch Atom using the installed atom command.
fi
