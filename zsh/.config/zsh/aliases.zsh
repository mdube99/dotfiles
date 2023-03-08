

function tn() { tmux new-session -A -s $(basename "$PWD") }

# Edit and rerun
function edit_and_run() {
    BUFFER="fc"
    zle accept-line
}
zle -N edit_and_run
bindkey "^v" edit_and_run

# Enter
function enter_line() {
    zle accept-line
}
zle -N enter_line
bindkey "^o" enter_line

# Exit tmux-pane
function exit_tmux() {
    BUFFER="exit"
    zle accept-line
}
zle -N exit_tmux
bindkey "^q" exit_tmux

# Sudo
function add_sudo() {
    BUFFER="sudo "$BUFFER
    zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo

# Run last command again
function runLastLine() {
    # Get previous history item
    zle up-history
    # confirm command
    zle accept-line
}
zle -N runLastLine
bindkey "^n" runLastLine

# Home - Navigates to the current root workspace
function git_root() {
    BUFFER="cd $(git rev-parse --show-toplevel || echo ".")"
    zle accept-line
}
zle -N git_root
bindkey "^g" git_root

# Backwards search with C-r
bindkey '^R' history-incremental-search-backward

# I can never remember the exact command to convert from docx to md so i thought this would be easier
convert2md() {
    pandoc -s $1 --wrap=none --reference-links -t markdown -o $2
}

# easier to type to run docx or excel files from command line
office() {
    libreoffice $1 &
}
# fzf command history search
fzh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# fkill - kill process
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]
        then
        echo $pid | xargs kill -${1:-9}
    fi
}

# Install packages using yay (change to pacman/AUR helper of your choice)
pacin() {
    yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}'| xargs -ro yay -S
}

# Remove installed packages (change to pacman/AUR helper of your choice)
pacrm() {
    yay -Qq | fzf -q "$1" -m --preview 'yay -Qi {1}' | xargs -ro yay -Rns
}

rmf() {
    ls | fzf -m | xargs -I {} rm -rf {
}

# Custom cd
c() {
    cd $1;
    exa --icons -1 --sort newest;
}

up() {
    ip a | grep -v inet6 | grep -F inet;
    updog -p 4444;
}

# Courtesy of Graham Helton
# e.g. cp `DL` .
DL() {
    variable1=$(echo ~/Downloads/$(/usr/bin/ls -ltr ~/Downloads | tail -n1 | awk {"print \$9"}));
    echo $variable1;
}

#Aliases
    alias cd="c"
    alias g="git"
    alias updog="up"
    alias pubip="curl ipinfo.io/ip"
    alias ls="exa --sort newest"
    alias ll="exa -l --sort newest"
    alias vim="nvim"
    alias lvim="$HOME/.local/bin/lvim"
    alias nvim "/usr/local/bin/nvim"
    alias vim="lvim"
    alias thunar="thunar . &"
    alias td="tmux detach"
    alias tk="tmux kill-session"

    alias yt="youtube-dl --add-metadata -i" # Download video link
    alias yta="yt --extract-audio --audio-format mp3" # Download only audio
    alias speedtest="speedtest-cli"
    alias pptxtopdf="soffice --headless --convert-to pdf $1"
    alias latexreload="latexmk -pdf -pvc $1"

    alias cme="crackmapexec"
    alias rustscan="docker run -it --rm --name rustscan rustscan/rustscan:1.10.0"

    #NOTE: for ST
    alias rel="xrdb merge ~/.Xresources && kill -USR1 $(pidof st)"
    alias notes='cd ~/notes && lvim -c ":Telescope live_grep" && cd -'
