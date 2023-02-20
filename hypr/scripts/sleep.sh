#!/bin/sh

status=`acpi -a | awk -F: '{printf $2}'`

# Adapter 0: on-line
if [[ $status == 'on-line' ]]; then
    bright_time=300
    lock_time=300
    dpms_time=3600
    suspend_time=7200
else
    # Adapter 0: off-line
    bright_time=60
    lock_time=300
    dpms_time=600
    suspend_time=1800
fi
swayidle timeout $bright_time 'temp=$(brightnessctl g); brightnessctl set $((temp / 2))' \
            resume 'temp=$(brightnessctl g); brightnessctl set $((temp * 2))' \
         timeout $lock_time 'swaylock -f' \
        timeout $dpms_time "hyprctl dispatch dpms off" \
            resume 'hyprctl dispatch dpms on' \
        timeout $suspend_time 'systemctl suspend' \
            resume 'hyprctl dispatch dpms on'
