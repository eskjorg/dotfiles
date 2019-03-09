# PATH
#typeset -U path
#path=(~/.local/bin /other/things/in/path $path[@])

# Autocompletion
autoload -Uz compinit
compinit

# Prompt
autoload -Uz promptinit
promptinit
prompt adam2

# Aliases
if [ -f $HOME/.alias ]; then
    source $HOME/.alias
fi

