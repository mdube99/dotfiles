[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/fzf"
plug "zap-zsh/atmachine-prompt"
plug "zap-zsh/completions"
plug "zap-zsh/vim"
plug "zap-zsh/supercharge"

source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/exports.zsh

unsetopt BEEP

# allows colors in zsh prompt
autoload -U colors && colors
setopt prompt_subst

# autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#575757"