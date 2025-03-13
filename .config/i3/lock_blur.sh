#!/usr/bin/sh

tmpbg='/tmp/screen.png'

scrot "$tmpbg"

convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"

~/Installs/i3lock-color/build/i3lock -n -i "$tmpbg" \
    --ringver-color=ffffffff --ringwrong-color=ffffffff
