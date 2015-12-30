# still a WIP
Use at your own risk

# New System Development environment setup
Intended to quickly and easily configure Development dependencies for a variety of disciplines
Initially created just for OSX I have been adding debian configurations as has been necesary

Install and Initialize:
```bash
git clone git@github.com:bhedana/box.git ~/.box
~/.box/bin/box init
```

See what commands are available:
```bash
~/.box/bin/box
```

See detailed help for commands:
```bash
~/.box/bin/box help defaults
```

Execute a command:
```bash
~/.box/bin/box defaults
```

###Next Steps
```bash
~/.box/bin/box essentials
~/.box/bin/box defaults
```

Customize in `~/.laptop.local`
------------------------------
  Your `~/.laptop.local` is run at the end of the Essentials command for OSX.
  Put desired customizations there.
  See .laptop.local.example for example customizations


##TODO

* add switches to packages
  - maybe i don't want to install the UI app for MySQL.. etc..

* improve usage and help documentation for each package

* handle package dependencies
  - i.e. darwin platform requires homebrew and xcode
  - i.e. scapy requires python

* complete missing installs
 
* absorb remaining cli-goodness and finally kill cli-goodness

* review https://github.com/atomantic and borrow more of their goodness

