# dotfiles

The purpose of this repo is to backup configs and to facilitate the setup of a fresh macOS machine. See scripts in `/setup`.

A list of sources and inspiration for a good setup can be found [here](setup/sources.txt).

## Setting up a new mac

First some manual things:

* Add your *Internet accounts*. This will download your iCloud keychain and much more.
* Update the OS: *Apple menu () > About This Mac > Software Update.*
* Command Line Tools ```xcode-select --install```

In order not to become insane:

* Go into *System Preferences > Trackpad* and do whatever you want to do.

Clone this repo as bare. This also checks out the repo, placing dotfiles in the home directory:

* ```curl -fsSL https://raw.githubusercontent.com/eskjorg/dotfiles/master/setup/bootstrap.sh | sh```

Then, run the installation script:

* ```bash ~/setup/install.sh```

The OS preferences will be set automatically by:

* ```~/setup/macos_defaults.sh```

Also, using your preferred secure method:

* Add your private encryption keys to the computer
