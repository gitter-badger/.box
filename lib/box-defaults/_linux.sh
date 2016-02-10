#!/usr/bin/env bash

#test if aptitude exists and default to using that if possible
if command -v aptitude >/dev/null 2>&1 ; then
  pm="aptitude"
else
  pm="apt-get"
fi
info -e "Using $pm for package installation\n"

action "Remapping Super_L"
touch $HOME/.Xmodmap
profile_write 'clear Mod4' $HOME/.Xmodmap
profile_write 'keycode 133 = Super_L NoSymbol Super_L' $HOME/.Xmodmap
profile_write 'add control = Control_L Super_L' $HOME/.Xmodmap
xmodmap $HOME/.Xmodmap
ok

action "Remapping terminal keybindings"
warn "only works for Ubuntu Mate"
gsettings set org.mate.terminal.keybindings close-tab "<Control>w"
gsettings set org.mate.terminal.keybindings close-window "<Control>q"
gsettings set org.mate.terminal.keybindings copy "<Control>c"
gsettings set org.mate.terminal.keybindings new-tab "<Control>t"
gsettings set org.mate.terminal.keybindings new-window "<Control>n"
gsettings set org.mate.terminal.keybindings paste "<Control>v"
gsettings set org.mate.terminal.keybindings reset-and-clear "<Control>k"
gsettings set org.mate.Marco.global-keybindings run-command-screenshot "<Primary><Shift>numbersign"
gsettings set org.mate.Marco.global-keybindings run-command-window-screenshot "<Primary><Shift>dollar"
gsettings set org.mate.Marco.window-keybindings activate-window-menu "[]"
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-down ""
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-up ""
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-left ""
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-right ""
gsettings set org.mate.Marco.window-keybindings move-to-workspace-down ""
gsettings set org.mate.Marco.window-keybindings move-to-workspace-up ""
gsettings set org.mate.Marco.window-keybindings move-to-workspace-left ""
gsettings set org.mate.Marco.window-keybindings move-to-workspace-right ""

ok

# turn on alt-space for Mutate default

#########################################################
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

action "Adding Mutate to autostart"
cp /usr/share/applications/Mutate.desktop ~/.config/autostart/mutate.desktop
ok

action "Change default keybinding for mutate to Alt+Space"
sed -i -- 's/HotKey=Alt+D/HotKey=Alt+Space/g' ~/.config/Mutate/config.ini
ok
