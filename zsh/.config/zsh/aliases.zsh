function tn() { tmux new-session -A -s $(basename "$PWD") }

# Backwards search with C-r
bindkey '^R' history-incremental-search-backward


# easier to type to run docx or excel files from command line
office() {
    libreoffice $1 &
}

# fzf command history search
fzh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
# search history with fzh
zle -N fzh
bindkey '^f' fzh

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
    ls;
}

# Print out IP address prior to 
up() {
    # copy IP address into clipboard
    IPADDRESS=$(ip a | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d '' | cut -f1 -d '/')
    TOCLIP="$IPADDRESS:4444"
    # copies the URL for updog into clipboard
    echo $TOCLIP | xsel --clipboard
    # ip a | grep -v inet6 | grep -F inet | grep /24;
    updog -p 4444;
}

# Courtesy of Graham Helton
# e.g. cp `DL` .
DL() {
    variable1=$(echo ~/Downloads/$(/usr/bin/ls -ltr ~/Downloads | tail -n1 | awk {"print \$9"}));
    echo $variable1;
}

# I do not like the random naming scheme zellij uses by default, so I use this
zelli() {
    zelCount=$(zellij list-sessions | wc -l)
    ((zelCount++)) # increment zelCount
    zellij attach --create $zelCount
}

#Aliases
    alias cd="c"
    alias g="git"
    alias updog="up"
    alias ls="ls -l"
    alias ll="ls -l"
    alias vim="nvim"
    alias thunar="thunar . &"
    alias td="tmux detach"
    alias tk="tmux kill-session"
    alias tl="tmux ls"
    alias zr="zellij run -- "
    alias zrf="zellij run -f -- "
    alias cat="batcat"
    
    # script to copy nmap scripts
    alias nmapScripts="ls /usr/share/nmap/scripts | fzf --reverse | xsel --clipboard"

    alias latexreload="latexmk -pdf -pvc $1"
    alias notes='cd ~/notes && vim -c ":Telescope live_grep" && cd -'

    # super useful for grabbing IP address per pane active
    # Finds active pane by the '*', then filters out just to the IP address
    alias IP='tmux list-windows | grep "\*" | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"'
    alias cpIP='tmux list-windows | grep "\*" | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | xsel --clipboard'
    # alias IP="tmux list-windows | grep '\*' | grep -o '^[^(]*' | awk -F ' ' '{print $2}'"
