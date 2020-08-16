#! /usr/bin/fish

swayidle -w timeout 600 'swaylock -f' timeout 900 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' before-sleep 'swaylock -f' &
disown
