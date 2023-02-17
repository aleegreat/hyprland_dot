#!/bin/bash

wallpaper_path=~/Pictures/wallpapers

IMG_NAME=$(ls ${wallpaper_path} | shuf -n 1)
IMG_PATH=${wallpaper_path}/$IMG_NAME
swaybg -i "${IMG_PATH}"
exit 0
