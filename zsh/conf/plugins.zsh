function zsh_add_file() {
    [ -f "$HOME/dotfiles/zsh/$1" ] && source "$HOME/dotfiles/zsh/$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$HOME/dotfiles/zsh/plugins/$PLUGIN_NAME" ]; then 
        # For plugins
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.sh"
    else
        git clone "https://github.com/$1.git" "$HOME/dotfiles/zsh/plugins/$PLUGIN_NAME"
    fi
}

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-history-substring-search"
zsh_add_plugin "iridakos/goto"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
