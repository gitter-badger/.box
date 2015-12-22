#!/usr/bin/env bash

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
ok

