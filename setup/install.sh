#! /bin/bash

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

# Basic tools
brew cask install osxfuse
brew install \
    git \
    zsh \
    bash-completion \
    docker-completion \
    wget \
    tree \
    sshfs \
    ssh-copy-id \
    googler

# Shell and completion
chsh -s $(which zsh)
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh  --create-dirs -o ~/.git/git-completion.zsh
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash  --create-dirs -o ~/.git/git-completion.bash
# oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# iTerm shell integration
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

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
    google-backup-and-sync \
    google-hangouts \
    spectacle \
    spotify \
    sublime-text \
    vlc

# Add Sublime Text as `subl` command
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Add anaconda to path
cat << EOF >> ~/.env

# Add Anaconda
export PATH="/usr/local/anaconda3/bin:$PATH"
EOF

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
    qbittorrent \
    slack \
    texshop \
    mactex \
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
    opencv
conda clean -ya

# Vagrant
# https://sourabhbajaj.com/mac-setup/Vagrant/
# https://medium.com/@JohnFoderaro/how-to-set-up-a-local-linux-environment-with-vagrant-163f0ba4da77
