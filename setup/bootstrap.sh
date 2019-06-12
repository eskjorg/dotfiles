#! /bin/bash

### load .files from bare repo 
git clone --bare https://github.com/eskjorg/dotfiles.git ~/workspace/dotfiles 
alias dot='git --git-dir=$HOME/workspace/dotfiles/ --work-tree=$HOME' 
dot config --local status.showUntrackedFiles no 
dot checkout -f
dot push -u origin master #set up 'master' to track remote branch 'master'
