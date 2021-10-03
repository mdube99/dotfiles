#!/bin/sh
bash ~/dotfiles/i3/scripts/docked_non_portrait_layout.sh
sleep 0.2
# launches polybar config to get bar for every monitor
bash ~/dotfiles/polybar/launch.sh &
i3-msg restart
