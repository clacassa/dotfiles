#! /bin/bash

# vol=`pactl list sinks | grep 'Volume' | head -n 1 | awk '{print $5}' | sed 's/[%]//g'`
# mute=`pactl list sinks | grep 'Sourdine' | head -n 1 | awk '{print $2}'` 
vol=$(amixer -D pulse get Master | grep 'Front' | tail -n1 | awk '{print $5}' | sed 's/[][%]//g')
mute=$(amixer -D pulse get Master | grep 'Front' | tail -n1 | awk '{print $6}' | sed 's/[][]//g')

if [ $vol -gt 100 ]
then
    pactl set-sink-volume @DEFAULT_SINK@ 100% 
    vol=100
fi

if [ $vol -lt 10 ]
then
    space="  "
elif [ $vol -lt 100 ]
then
    space=" "
fi

if [ $vol -gt 67 ]
then
    icon="audio-volume-high-symbolic.symbolic.png"
elif [ $vol -gt 34 ]
then
    icon="audio-volume-medium-symbolic.symbolic.png"
else
    icon="audio-volume-low-symbolic.symbolic.png"
fi


LEN=20
FILLED_ITEMS=$(echo "((${LEN} * ${vol})/100 + 0.5) / 1" | bc)
NOT_FILLED_ITEMS=$(echo "$LEN- $FILLED_ITEMS" | bc)
progress_bar=$(printf "%${FILLED_ITEMS}s" | sed "s| |█|g")
progress_bar=${progress_bar}$(printf "%${NOT_FILLED_ITEMS}s" | sed "s| | |g")
echo $progress_bar

if [[ $mute == "off" || $vol -eq 0 ]]
then
    icon="audio-volume-muted-symbolic.symbolic.png"
    vol="muted"
    space=""
    progress_bar=""
else
    vol="${vol}%"
fi

icon_path="/usr/share/icons/Adwaita/16x16/status/"
dunstify "Volume $space$vol $progress_bar" -i $icon_path$icon -u low -t 2000 -r 9001 

