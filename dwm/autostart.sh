#!/bin/sh
# This is a simple autostart script to run the bar
# Put it in ~/dwm, ~/.local/share/dwm, or ~/.dwm

# Running our bars. We need to close any running instances first
for pidofbar in $(ps --user "$USER" -F | grep dwmstatusbar | awk '{print $2}'); do kill -15 $pidofbar 2>/dev/null; done
{ dwmstatusbar || xsetroot -name " Statusbar not running... "; } &

# Running our necessary programs if you have them
lxpolkit &
picom &
nm-applet &
mpd &

# Remapping caps lock key to mod3
xmodmap -e "clear lock" \
        -e "clear mod4" \
        -e "keycode 66 = Super_R" \
        -e "add mod3 = Super_R" \
        -e "add mod4 = Super_L"
xcape -t 200 -e 'Super_R=Escape'
