#!/bin/sh


status=`acpi -a | awk -F: '{printf $2}'`

# Adapter 0: on-line
if [[ $status == "on-line" ]]; then
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

temp=$(brightnessctl g);
if [[ $temp -eq 0 ]]; 
then
    temp=100
fi
swayidle -w before-sleep "swaylock -f" \
        timeout $bright_time "brightnessctl set $((temp/2))" \
            resume "brightnessctl set $temp" \
        timeout $lock_time "swaylock -f" \
        timeout $dpms_time "hyprctl dispatch dpms off" \
            resume "hyprctl dispatch dpms on" \
        timeout $suspend_time "systemctl suspend" \
            resume "hyprctl dispatch dpms on"
