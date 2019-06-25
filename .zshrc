# PATH
#typeset -U path
#path=(~/.local/bin /other/things/in/path $path[@])

# Autocompletion
zstyle ':completion:*:*:git:*' script ~/.git/git-completion.bash
#fpath=(~/.zsh $fpath)
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

# Git
source ~/.git/git-completion.zsh

# Environment
source ~/.env

# iTerm integration
source ~/.iterm2_shell_integration.zsh