[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/atmachine-prompt"
plug "zap-zsh/completions"
plug "jeffreytse/zsh-vi-mode"
plug "zap-zsh/fzf"
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

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
#
# use `bat` for preview if installed, `head` otherwise
# https://github.com/sharkdp/bat
if command -v bat > /dev/null 2>&1; then
  FZF_PREVIEW_CMD="bat --style=numbers --color=always {} || ls -la {}"
  # bat options
  export BAT_PAGER="less -R"
  export BAT_THEME="1337"
else
  FZF_PREVIEW_CMD="head -n FZF_PREVIEW_LINES {} || ls -la {}"
fi
# https://github.com/BurntSushi/ripgrep
if command -v rg > /dev/null 2>&1; then
  RG_OPTS="--files --no-ignore --hidden --follow -g '!{.git,node_modules}/*' 2> /dev/null"
  export FZF_DEFAULT_COMMAND="rg $RG_OPTS"
  export FZF_CTRL_T_COMMAND="rg $RG_OPTS"
fi

# # Fixes colors not working with zsh-vi-mode
function zvm_after_init() {
  autoload add-zle-hook-widget
  add-zle-hook-widget zle-line-pre-redraw zvm_zle-line-pre-redraw
}
