#!/bin/bash

# options to be displyed
option0="onedark"
option1="dracula"
option2="gruvbox"
option3="material"
option4="minimal"
option5="dark"
option6="nord"
option7="siduck"
option8="tokyonight"

# Variable passed to rofi
options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5\n$option6\n$option7\n$option8"

selected="$(echo -e "$options" | rofi -lines 13 -dmenu -theme ~/dotfiles/rofi/rofi_no_icon_config.rasi "theme")"

case $selected in
    $option0)
        xrdb merge $HOME/.Xresources;;
    $option1)
        xrdb merge ~/dotfiles/Xresources/dracula/.Xresources;;
    $option2)
        xrdb merge ~/dotfiles/Xresources/gruvbox/.Xresources;;
	$option3)
        xrdb merge ~/dotfiles/Xresources/material/.Xresources;;
	$option4)
        xrdb merge ~/dotfiles/Xresources/minimal/.Xresources;;
    $option5)
        xrdb merge ~/dotfiles/Xresources/dark/.Xresources;;
    $option6)
        xrdb merge ~/dotfiles/Xresources/nord/.Xresources;;
    $option7)
        xrdb merge ~/dotfiles/Xresources/siduck/.Xresources;;
    $option8)
        xrdb merge ~/dotfiles/Xresources/tokyonight/.Xresources;;
esac
