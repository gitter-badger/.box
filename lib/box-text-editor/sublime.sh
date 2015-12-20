#!/usr/bin/env bash
source "$_BOX_ROOT/lib/box_functions"

bot "Install Sublime Text"

if [ "$NS_PLATFORM" == "darwin" ]; then
  require_cask sublime-text
	
  running "set out custom preferences for sublime"
  cp "$_BOX_ROOT/lib/box-sublime-text/Preferences.sublime-settings" ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
  ok

  running "try install package manager -- this may have to be done manuually"
  cp "$_BOX_ROOT/liv/box-sublime-text/Package\ Control.sublime-package" ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Package\ Control.sublime-packag
  ok
  # https://sublime.wbond.net/installation#st2
  git_clone_or_update https://github.com/wbond/sublime_alignment.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/sublime_alignment
  git_clone_or_update https://github.com/alienhard/SublimeAllAutocomplete ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/SublimeAllAutocomplete
  git_clone_or_update https://github.com/BoundInCode/AutoFileName.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/AutoFileName
  git_clone_or_update https://github.com/JasonMortonNZ/bs3-sublime-plugin.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/bs3-sublime-plugin
  git_clone_or_update https://github.com/facelessuser/BracketHighlighter.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/BracketHighlighter
  git_clone_or_update https://github.com/kemayo/sublime-text-git.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/sublime-text-git
  git_clone_or_update https://github.com/jisaacks/GitGutter.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/GitGutter
  git_clone_or_update https://github.com/alek-sys/sublimetext_indentxml.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/sublimetext_indentxml
  git_clone_or_update https://github.com/davidrios/jade-tmbundle.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/jade-tmbundle
  git_clone_or_update https://github.com/srusskih/SublimeJEDI.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/SublimeJEDI
  git_clone_or_update https://github.com/eliquious/Python-Auto-Complete.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Python-Auto-Complete
  git_clone_or_update https://github.com/vi4m/sublime_python_imports.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/sublime_python_imports
  git_clone_or_update https://bitbucket.org/StephaneBunel/pythonpep8autoformat ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/pythonpep8autoformat
  git_clone_or_update https://github.com/kedder/sublime-python-traceback.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/sublime-python-traceback
  git_clone_or_update https://github.com/titoBouzout/SideBarEnhancements.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/SideBarEnhancements
  git_clone_or_update https://github.com/SublimeCodeIntel/SublimeCodeIntel.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/SublimeCodeIntel
fi

if [ "$NS_PLATFORM" == "linux" ]; then
  sudo add-apt-repository ppa:webupd8team/sublime-text-2
  sudo apt-get update
  sudo apt-get install -y sublime-text

  running "set out custom preferences for sublime"
  cp "$_BOX_ROOT/lib/box-sublime-text/Preferences.sublime-settings" "$HOME/.config/sublime-text-2/Packages/User/Preferences.sublime-settings"
  ok
  # determine correct path and add package manager and packages from above
fi