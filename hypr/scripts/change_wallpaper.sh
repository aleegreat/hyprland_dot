#!/bin/bash

echo header

export XDG_CACHE_HOME=~/.cache

WALLPAPER_PATH=~/Pictures/wallpapers
IMG_NAME=$(ls ${WALLPAPER_PATH} | shuf -n 1)
IMG_PATH=${WALLPAPER_PATH}/$IMG_NAME
#swaybg -i "${IMG_PATH}"

init(){
    swww init
    sleep 3
    swww img "${IMG_PATH}" --transition-step 100 --transition-fps 60 --transition-type random
}
change(){
    swww img "${IMG_PATH}" --transition-step 100 --transition-fps 60 --transition-type random ;
}

case "$1" in
  change) change;;
  init) init;;
esac
