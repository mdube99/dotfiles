clear
export TERM=screen-256color


# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=10000
	setopt inc_append_history # To save every command before it is executed
	setopt share_history # setopt inc_append_history
    KEYTIMEOUT=2

	git config --global push.default current

	mkdir -p /tmp/log

	# This is currently causing problems (fails when you run it anywhere that isn't a git project's root directory)
	# alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"

# Settings
    export VISUAL=nvim
    MANPAGER='nvim +Man!'
    export EDITOR=nvim


    plugins=(
    colored-man-pages

)

source ~/dotfiles/zsh/plugins/fixls.zsh

 	# Custom cd
 	c() {
 		cd $1;
 		ls -1;
 	}

# I can never remember the exact command to convert from docx to md so i thought this would be easier
    convert2md() {

        pandoc -s $1 --wrap=none --reference-links -t markdown -o $2

    }

# easier to type to run docx or excel files from command line
    office() {
        libreoffice $1 &

    }

#Aliases
    alias cd="c"
    alias ls="ls --color=auto  --sort=version --group-directories-first"
    alias pubip="curl ipinfo.io/ip"
    alias ls="ls --color=auto"
    alias ll=" ls -l --group-directories-first"
    alias vi="/usr/local/bin/nvim"
    alias vim="/usr/local/bin/nvim"
    alias nvim "/usr/local/bin/nvim"
    alias wiki="vim ~/vimwiki/index.md"
    alias yt="youtube-dl --add-metadata -i" # Download video link
    alias yta="yt --extract-audio --audio-format mp3" # Download only audio
    alias speedtest="speedtest-cli"
    alias calc="gcalccmd"
    alias volume="amixer sset 'Master'"
    alias piavpn="/opt/piavpn/bin/pia-client &"
    alias kalidocker="sudo docker run -ti -p 80:80 -p 443:443 -v /root/clients:/clients mdube/kali-docker"
    alias sec+="mupdf ~/vimwiki/securityplus/professor_messer_secplus_notes/professor-messer-comptia-sy0-501-security-plus-course-notes-v193.pdf &"
    alias pomodoro="python ~/development/Pomodoro/main.py"
    alias pptxtopdf="soffice --headless --convert-to pdf $1"

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
# Path for scripts such as ta
export PATH=$HOME/development/scripts:$PATH
