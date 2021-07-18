#!/bin/sh
echo "Docking for Gaming"
# sets monitor stuff up for main monitor
xrandr --output eDP-1 --auto --output DP-1-0 --primary --mode 2560x1440 --rate 144 --pos 0x0 --rotate normal --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off --output HDMI-1-0 --off --output DP-1-4 --off
sleep 0.5
# launches polybar config to get bar for every monitor
bash ~/dotfiles/polybar/launch.sh &
sleep 0.5
i3-msg restart
