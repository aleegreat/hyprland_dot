#!/bin/sh
player="com.github.gmg137.netease-cloud-music-gtk"

status=`playerctl -p $player status`
if [[ $status=="Paused" ]]; then
    icon=" "
elif [[ $status=="Playing" ]]; then
    icon="♪ "
else
    icon="xx"
fi

playerctl -a metadata --format \
'{"text": "{{artist}} - {{markup_escape(title)}}", 
"tooltip": "{{markup_escape(title)}}", 
"alt": "{{status}}", 
"class": "{{status}}"
}' -F

#echo $res
#echo $icon