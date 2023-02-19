#!/bin/sh
swayidle timeout 60 'temp=$(brightnessctl g); brightnessctl set $((temp / 2))' \
            resume 'temp=$(brightnessctl g); brightnessctl set $((temp * 2))' \
         timeout 180 'swaylock -f' \
        timeout 300 "hyprctl dispatch dpms off" \
            resume 'hyprctl dispatch dpms on' \
        timeout 1800 'systemctl suspend' \
            resume 'hyprctl dispatch dpms on'
