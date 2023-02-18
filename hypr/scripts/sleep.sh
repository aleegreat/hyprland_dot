#!/bin/sh
swayidle -w \
        before-sleep swaylock \
        timeout 180 'temp=$(brightnessctl g); brightnessctl set $((temp / 2))' \
            resume 'temp=$(brightnessctl g); brightnessctl set $((temp * 2))' \
        timeout 600 "hyprctl dispatch dpms off" \
            resume 'hyprctl dispatch dpms on' \
        timeout 600 'systemctl suspend' \
            resume 'hyprctl dispatch dpms on'
