export EDITOR="nvim"
export VISUAL="nvim"
export TERM=screen-256color
export PATH=$HOME/development/scripts:$HOME/.local/bin:$(go env GOPATH)/bin:$PATH
export TERMINAL=/usr/local/bin/st
export GOPATH=$(go env GOPATH)
# Open manpages in lunarvim
export MANPAGER="/bin/zsh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
export FZF_DEFAULT_COMMAND='rg --vimgrep --files --no-ignore --hidden --follow --glob "!.git/*"'

HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..)"
setopt inc_append_history # To save every command before it is executed
setopt share_history # setopt inc_append_history
KEYTIMEOUT=2

git config --global push.default current
