# still a WIP
Use at your own risk

# New System development environment setup
Intended to quickly and easily configure development dependencies for a variety of disciplines
Initially created just for OSX I have been adding debian configurations as has been necesary

Install and Initialize:
```bash
git clone git@github.com:bhedana/box.git ~/.box
~/.box/bin/box init
```

See what commands are available:
```bash
~/.box/bin/box commands
```

See detailed help for commands:
```bash
~/.box/bin/box help defaults
```

Execute a command:
```bash
~/.box/bin/box defaults
```

###Next Steps for OSX
```bash
~/.box/bin/box xcode
~/.box/bin/box homebrew
~/.box/bin/box essentials
~/.box/bin/box defaults
```

Customize in `~/.laptop.local`
------------------------------
  Your `~/.laptop.local` is run at the end of the Essentials command.
  Put desired customizations there.
  See .laptop.local.example for example customizations


##TODO

* update antigen to https://github.com/Tarrasch/antigen-hs for faster loding of zsh env

* add switches to packages
  - maybe i don't want to install the UI app for MySQL.. etc..

* add usage and help documentation for each package

* handle package dependencies
  - i.e. darwin platform requires homebrew and xcode
  - i.e. scapy requires python

* complete missing installs
 
* absorb remaining cli-goodness and finally kill cli-goodness

* review https://github.com/atomantic and borrow more of their goodness

* add script(s) for easy creation of project dirs
 - create new dir
 - create autoenv (.env) conf file for dir
   - set GOPATH for go projects
   - set .ruby-version and .ruby-gemset for ruby projects
   - set jvm version for java projects
   - set ALL the things for python and others.. oh my..
