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
    logo-ls -1;
}
#Aliases
    alias cd="c"
    alias activateanaconda="source /opt/anaconda/bin/activate root"
    alias ls="ls --color=auto  --sort=version --group-directories-first"
    alias pubip="curl ipinfo.io/ip"
    alias ls="logo-ls"
    alias ll="ls -l"
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
    alias load="kill -USR1 $(pidof st)"
    alias use="xrdb merge"
