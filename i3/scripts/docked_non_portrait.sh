#!/bin/sh
xrandr --output eDP-1 --mode 1920x1080 --pos 4480x180 --rotate normal --output DP-1-0 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output DP-1-1 --off --output DP-1-2 --mode 1920x1080 --pos 0x180 --rotate normal --output DP-1-3 --off --output HDMI-1-0 --off --output DP-1-4 --off
sleep 0.2
# launches polybar config to get bar for every monitor
bash ~/dotfiles/polybar/launch.sh &
i3-msg restart
