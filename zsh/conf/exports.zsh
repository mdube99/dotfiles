export EDITOR="lvim"
export VISUAL="lvim"
export TERM=screen-256color
export EDITOR=nvim
export PATH=$HOME/development/scripts:$PATH
export TERMINAL=/usr/local/bin/st

HISTFILE=~/.zsh_history
SAVEHIST=10000
setopt inc_append_history # To save every command before it is executed
setopt share_history # setopt inc_append_history
KEYTIMEOUT=2

git config --global push.default current
