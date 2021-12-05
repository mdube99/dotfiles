# git
function git_prepare() {
    if [ -n "$BUFFER" ];
        then
            BUFFER="git add -A && git commit -m \"$BUFFER\" && git push"
    fi

    if [ -z "$BUFFER" ];
        then
            BUFFER="git add -A && git commit -v && git push"
    fi
            
    zle accept-line
}
zle -N git_prepare
bindkey "^g" git_prepare

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

# Exit tmux-session
function tmux_kill_session() {
    BUFFER="tmux kill-session"
    zle accept-line
}
zle -N tmux_kill_session
bindkey "^k" tmux_kill_session

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
bindkey "^h" git_root
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
# Custom cd
c() {
    cd $1;
    exa --icons -1;
}
#Aliases
    alias cd="c"
    alias g="git"
    alias activateanaconda="source /opt/anaconda/bin/activate root"
    alias pubip="curl ipinfo.io/ip"
    alias ls="exa --icons --sort newest"
    alias ll="ls -l --sort newest"
    alias vim="$HOME/.local/bin/lvim"
    alias lvim="$HOME/.local/bin/lvim"
    alias nvim "/usr/local/bin/nvim"
    alias wiki="vim ~/vimwiki/index.md"
    alias yt="youtube-dl --add-metadata -i" # Download video link
    alias yta="yt --extract-audio --audio-format mp3" # Download only audio
    alias speedtest="speedtest-cli"
    alias volume="amixer sset 'Master'"
    alias kalidocker="sudo docker run -ti -p 80:80 -p 443:443 -v /root/clients:/clients mdube/kali-docker"
    alias sec+="mupdf ~/vimwiki/securityplus/professor_messer_secplus_notes/professor-messer-comptia-sy0-501-security-plus-course-notes-v193.pdf &"
    alias pomodoro="python ~/development/Pomodoro/main.py"
    alias pptxtopdf="soffice --headless --convert-to pdf $1"
    alias league="sudo sysctl -w abi.vsyscall32=0"
    #NOTE: for ST
    alias rel="xrdb merge ~/.Xresources && kill -USR1 $(pidof st)"
