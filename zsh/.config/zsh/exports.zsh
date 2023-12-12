export EDITOR="nvim"
export VISUAL="nvim"
export TERM=screen-256color
export PATH=$HOME/development/scripts:/mnt/hgfs/kali-shared-files/development:$HOME/.local/bin:$(go env GOPATH)/bin:$HOME/.cargo/bin:$PATH
export TERMINAL=/usr/local/bin/st
export GOPATH=$(go env GOPATH)
# Open manpages in lunarvim
export MANPAGER="/bin/zsh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
export FZF_DEFAULT_COMMAND='rg --vimgrep --files --no-ignore --hidden --follow --glob "!.git/*"'

# for tmux session manager
export PATH=$HOME/dotfiles/tmux/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..)"
setopt inc_append_history # To save every command before it is executed
setopt share_history # setopt inc_append_history
KEYTIMEOUT=2

git config --global push.default current
