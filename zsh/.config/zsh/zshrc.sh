[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
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

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
