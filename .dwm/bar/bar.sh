#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

BKLIGHTPREFIX='ﯧ'


interval=0

# load colors!
. ~/.dwm/bar/themes/tokyonight

pulse () {
    VOL=$(pamixer --get-volume)
    STATE=$(pamixer --get-mute)
    
    printf "^c$black^ ^b$blue^ %s" "^c$white^ ^b$grey^ $SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATE" = "true" ] || [ "$VOL" -eq 0 ]; then
            printf "🔇"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "🔈 %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "🔉 %s%%" "$VOL"
        else
            printf "🔊 %s%%" "$VOL"
        fi
    else
        if [ "$STATE" = "true" ] || [ "$VOL" -eq 0 ]; then
            printf "MUTE"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "VOL %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "VOL %s%%" "$VOL"
        else
            printf "VOL %s%%" "$VOL"
        fi
    fi
    printf "^c$black^ %s\n" "^c$white^^b$black^$SEP2"
}

cpu() {
	cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

	printf "^c$black^ ^b$green^ CPU"
	printf "^c$white^ ^b$grey^ $cpu_val"
}

pkg_updates() {
	# updates=$(doas xbps-install -un | wc -l) # void
	updates=$(checkupdates | wc -l)   # arch , needs pacman contrib
	# updates=$(aptitude search '~U' | wc -l)  # apt (ubuntu,debian etc)

	if [ -z "$updates" ]; then
		printf "^c$green^  Fully Updated"
	else
		printf "^c$green^  $updates"" updates"
	fi
}

battery() {
	get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
	printf "^c$black^ ^b$darkblue^  ^c$white^ ^b$grey^ $get_capacity%%"
}

brightness() {
	printf "^c$red^   "
	printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
}

get_backlight()
{
    echo "^c$black^ ^b$darkblue^ $BKLIGHTPREFIX ^c$white^ ^b$grey^ $(light | sed 's/\..*//g')%"
}

mem() {
	printf "^c$blue^^b$black^  "
	printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Connected" ;;
	down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
	esac
}

clock() {
	printf "^c$black^ ^b$darkblue^ 󱑆 "
	printf "^c$black^^b$blue^ $(date '+%A, %d %b %I:%M %p') "
	# printf "^c$black^^b$blue^ $(date '+%I:%M %p') "
}

while true; do

	[ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
	interval=$((interval + 1))

    sleep 1 && xsetroot -name "  $(battery) $(get_backlight) $(cpu) $(mem) $(pulse) $(wlan) $(clock)"
done
