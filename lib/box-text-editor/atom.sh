#!/usr/bin/env bash
source "$_BOX_ROOT/lib/box_functions"

bot "Install Atom Text Editor"

running "installing atom"
if [ "$NS_PLATFORM" == "darwin" ]; then
  require_cask atom
fi
if [ "$NS_PLATFORM" == "linux" ]; then
  wget https://github.com/atom/atom/releases/download/v1.3.2/atom-amd64.deb
  sudo dpkg --install atom-amd64.deb
  rm -f atom-amd64.deb

  warn "Currently only a 64-bit version is available."
  warn "The Linux version does not currently automatically update"
  warn "so you will need to repeat these steps to upgrade to future releases."
fi
ok


# # create keyboard command to show invisible characters
#
# # In init.cofee add
# atom.commands.add 'atom-text-editor',
#   'settings:toggle-show-invisibles': (event) ->
#     invisibles = atom.config.get('editor.showInvisibles')
#     atom.config.set('editor.showInvisibles', !invisibles)
#
# # In keymap.cson add
# '.workspace .editor:not(.mini), .workspace, .platform-darwin, .platform-win32, .platform-linux':
#   'cmd-i': 'settings:toggle-show-invisibles'
