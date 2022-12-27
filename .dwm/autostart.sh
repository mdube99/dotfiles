#!/bin/sh

BG="Mountain.jpg"

# add your autostart stuffs here

# Scripts
~/dotfiles/scripts/./touchpad-settings &
# main programs
xrdb merge ~/.Xresources &
nm-applet &
picom -b -f --config ~/dotfiles/picom/picom.conf --experimental-backends &
xss-lock --transfer-sleep-lock -- betterlockscreen -l dimblur &
flameshot &
discord &
blueman-applet &
/usr/lib/polkit-gnome/./polkit-gnome-authentication-agent-1 &

# run bar script and dwm ( do not remove this ) 
~/.dwm/bar/./bar.sh &


sleep 1
feh --bg-fill ~/Pictures/Backgrounds/$BG &
# so you can restart dwm - dwmbar will not work if you restart dwm
while type dwm >/dev/null ; do dwm && continue || break ; done
