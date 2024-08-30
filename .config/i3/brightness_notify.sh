#! /bin/sh
# Notify upon brightness change

brightness=`xbacklight -get`

brightness=$(echo "${brightness} / 1" | bc)
dunstify "Brightness" -h int:value:$brightness -i display-brightness-symbolic -u low -t 2000 -r 9001
