export EDITOR="lvim"
export VISUAL="lvim"
export EDITOR=lvim
export TERM=screen-256color
export PATH=$HOME/development/scripts:$PATH
# Open manpages in lunarvim
export MANPAGER="/bin/zsh -c \"col -b | lvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# FOR CTFs - having $IP in terminal is really nice
export IP="10.20.25.69"

HISTFILE=~/.zsh_history
SAVEHIST=10000
setopt inc_append_history # To save every command before it is executed
setopt share_history # setopt inc_append_history
KEYTIMEOUT=2

git config --global push.default current
