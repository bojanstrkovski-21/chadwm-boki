#!/bin/dash

#case "$1" in
#  "audio_up") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ ;;
#  "audio_down") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
#  "audio_toggle") wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
#esac


case "$1" in
  "1") pavucontrol & ;;  # Left click opens pavucontrol
esac