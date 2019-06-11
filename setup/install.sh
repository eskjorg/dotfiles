#! /bin/bash

# Command Line Tools (CLT) for Xcode
xcode-select --install

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

# Basic tools
brew install \
    git \
    zsh \
    bash-completion \
    docker-completion
    wget \
    tree \
    sshfs \
    ssh-copy-id

### load .files from bare repo
git clone --bare git@github.com:eskjorg/dotfiles.git ~/workspace/dotfiles
alias dot='git --git-dir=$HOME/workspace/dotfiles/ --work-tree=$HOME'
dot config --local status.showUntrackedFiles no
dot checkout
dot push -u origin master #set up 'master' to track remote branch 'master'

# Shell and completion
chsh -s $(which zsh)
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh  --create-dirs -o ~/.git/git-completion.zsh
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash  --create-dirs -o ~/.git/git-completion.bash
# oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# SSH keys
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

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
    cheatsheet \
    docker \
    dropbox \
    google-chrome \
    google-drive \
    google-hangouts \
    pdftk \
    spectacle \
    spotify \
    sublime-text \
    totalfinder \
    vlc

# Add Sublime Text as `subl` command
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Add vscode as `code` command
cat << EOF >> ~/.env
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
# Install extensions
cat ~/.vscode_extensions | xargs -L1 code --install-extension
# Link settings
ln -s '/Users/eskjor/.vscode.settings.json /Users/eskjor/Library/Application\ Support/Code/User/settings.json'


# More Apps
brew cask install \
    disk-inventory-x \
    gpg-suite-no-mail \
    iterm2 \
    macdown \
    microsoft-office \
    mendeley \
    osxfuse \
    qbittorrent \
    slack \
    texshop \
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
