#!/bin/sh

#xrdb merge ~/.Xresources 
#xbacklight -set 10 &
feh --bg-fill ~/Pictures/gruv.png &
#xset r rate 200 50 &
picom &
eww daemon &
dash ~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
