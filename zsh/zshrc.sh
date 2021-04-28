clear


# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000 
	setopt inc_append_history # To save every command before it is executed 
	setopt share_history # setopt inc_append_history

	git config --global push.default current

	mkdir -p /tmp/log
	
	# This is currently causing problems (fails when you run it anywhere that isn't a git project's root directory)
	# alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"

# Settings
    export VISUAL=vim
    MANPAGER='vim +Man!'


    plugins=(
    colored-man-pages

)

source ~/dotfiles/zsh/plugins/fixls.zsh

 	# Custom cd
 	c() {
 		cd $1;
 		ls -l;
 	}
#Aliases
    alias cd="c"
    alias vi="vim"
    alias pubip="curl ipinfo.io/ip"
    alias ll=" ls -l"
    alias r="vifm"
    alias v="vifm"
    alias vim="vim"
    alias wiki="vim ~/vimwiki/index.md"
    alias yt="youtube-dl --add-metadata -i" # Download video link
    alias yta="yt --extract-audio --audio-format mp3" # Download only audio
    alias speedtest="speedtest-cli"
    alias vscode="code"
    alias calc="gcalccmd"
    alias volume="amixer sset 'Master'"
    alias piavpn="/opt/piavpn/bin/pia-client"
    alias league="WINEPREFIX=~/Games-Wine/LoL WINEARCH=win32 /opt/wine-lol/bin/wine ~/Games-Wine/LoL/drive_c/Riot\ Games/League\ of\ Legends/LeagueClient.exe"


# For vim mappings: 
	stty -ixon

# Completions
# These are all the plugin options available: https://github.com/robbyrussell/oh-my-zsh/tree/291e96dcd034750fbe7473482508c08833b168e3/plugins
#
# Edit the array below, or relocate it to ~/.zshrc before anything is sourced
# For help create an issue at github.com/parth/dotfiles

autoload -U compinit

for plugin ($plugins); do
    fpath=(~/dotfiles/zsh/plugins/oh-my-zsh/plugins/$plugin $fpath)
done

compinit

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/keybindings.sh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/colored-man-pages.plugin.zsh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source ~/dotfiles/zsh/prompt.sh
export PATH=$PATH:$HOME/dotfiles/utils
