#! /bin/bash

# Command Line Tools (CLT) for Xcode
xcode-select --install

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

# Basic tools
brew install \
    zsh \
    bash-completion \
    docker-completion
    wget \
    tree \
    #fsf \
    #ach \

# oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Gitignore
curl https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore -o ~/.gitignore

# Quick Look plugins
brew cask install \
    qlcolorcode \
    qlstephen \
    qlmarkdown \
    quicklook-json \
    qlprettypatch \
    quicklook-csv \
    betterzip \
    webpquicklook \
    suspicious-package

# Apps
brew cask install \
    alfred \
    anaconda \
    appcleaner \
    #caffeine \
    cheatsheet \
    docker \
    dropbox \
    google-chrome \
    google-drive \
    google-hangouts \
    #latexian \
    pdftk \
    spectacle \
    spotify \
    sublime-text \
    #superduper \
    totalfinder \
    #valentina-studio \
    vlc

# Add `subl` command
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# More Apps
brew cask install \
    disk-inventory-x \
    gpg-suite-no-mail \
    iterm2 \
    macdown \
    mendeley \
    qbittorrent \
    slack \
    texshop \
    the-unarchiver \
    vagrant \
    vagrant-manager \
    virtualbox \
    visual-studio-code \

# Python
conda install -y -c pytorch \
    pytorch \
    torchvision
conda install -y -c conda-forge \
    attrdict \
    opencv \
    tensorboardX
conda clean -ya

# Vagrant
# https://sourabhbajaj.com/mac-setup/Vagrant/
# https://medium.com/@JohnFoderaro/how-to-set-up-a-local-linux-environment-with-vagrant-163f0ba4da77
