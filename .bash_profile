export LSCOLORS="EHfxcxdxBxegecabagacad"

source ~/.env

source ~/.git/git-completion.bash

if [ -f $HOME/.alias ]; then
    source $HOME/.alias
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
