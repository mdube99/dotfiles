#!/usr/bin/env bash

# Add this script to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
# Little script to have polybar open on every monitor
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar -q main --config=/$HOME/dotfiles/polybar/config.ini &
    done
else
    polybar -q main --config=/$HOME/dotfiles/polybar/config.ini &
fi
