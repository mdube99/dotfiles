#!/bin/bash

# options to be displyed
option0="activate all monitors"
option1="monitor eDP-1 off"
option2="monitor DP-1-0 off"
option3="monitor eDP-1 primary"
option4="monitor DP-1-0 primary"
option5="monitor DP-1-0 same as eDP-1"
option6="monitor DP-1-0 right of eDP-1"
option7="monitor DP-1-0 left of eDP-1"
option8="monitor DP-1-0 above eDP-1"
option9="gaming"
option10="dock laptop"
option11="side monitor normal"
option12="side monitor portrait"

# Variable passed to rofi
options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5\n$option6\n$option7\n$option8\n$option9\n$option10\n$option11\n$option12"

selected="$(echo -e "$options" | rofi -lines 13 -dmenu -p "xrandr" -theme ~/dotfiles/rofi/rofi_no_icon_config.rasi "xrandr")"

case $selected in
    $option0)
        xrandr --auto;;
    $option1)
        xrandr --output eDP-1-1 --off
        bash ~/dotfiles/polybar/launch.sh &;;
    $option2)
        xrandr --output DP-1-0 --off;;
	$option3)
		xrandr --output eDP-1 --primary;;
	$option4)
		xrandr --output DP-1-0 --primary;;
    $option5)
        xrandr --output DP-1-0 --same-as eDP-1;;
    $option6)
        xrandr --output DP-1-0 --right-of eDP-1;;
    $option7)
        xrandr --output DP-1-0 --left-of eDP-1;;
    $option8)
        xrandr --output DP-1-0 --above eDP-1;;
    $option9)
        bash $HOME/dotfiles/i3/scripts/gaming.sh;;
    $option10)
        bash $HOME/development/scripts/dock;;
    $option11)
        bash $HOME/dotfiles/i3/scripts/docked_non_portrait.sh;;
    $option12)
        bash $HOME/development/scripts/dock;;
esac
