export LSCOLORS="EHfxcxdxBxegecabagacad"

source ~/.env

source ~/.git/git-completion.bash

# Alias
[ -f $HOME/.alias ] && \
    source $HOME/.alias

# Bash completion
[ -f `brew --prefix`/etc/bash_completion ] && \
    source `brew --prefix`/etc/bash_completion
