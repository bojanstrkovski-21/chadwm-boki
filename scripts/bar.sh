#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/chadwm-boki/scripts/bar_themes/everforest-md

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$white^ "
  printf "^c$white^ $cpu_val"
}

pkg_updates() {
  #updates=$({ timeout 20 doas xbps-install -un 2>/dev/null || true; } | wc -l) # void
  updates=$({ timeout 20 checkupdates 2>/dev/null || true; } | wc -l) # arch
  # updates=$({ timeout 20 aptitude search '~U' 2>/dev/null || true; } | wc -l)  # apt (ubuntu, debian etc)

  if [ -z "$updates" ]; then
    printf "  ^c$orange^   󰮯 Fully Updated"
  else
    printf "  ^c$orange^   󰮯 $updates"" updates"
  fi
}

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
  printf "^c$blue^   $get_capacity"
}

brightness() {
  printf "^c$red^   "
  printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
}

mem() {
  printf "^c$blue^^b$black^ "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Connected" ;;
	down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
	esac
}

clock() {
	printf "^c$darkblue^ "
	printf "^c$blue^ $(date '+%d.%m.%Y')"
}
clock2() {
  printf "^c$darkblue^󱑒 "
  printf "^c$blue^$(date '+%H:%M') "
}

audio() {
  # Get volume using pipewire
  vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
  
  # Check if muted
  mute=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED")
  
  if [ -n "$mute" ]; then
    printf "^c$red^^s1^   $vol%%^d^"
  else
    printf "^c$green^^s1^  $vol%%^d^"
  fi
}

# Handle clicks (integrate with your click handler)
handle_click() {
  case "$1" in
    "audio")
      pavucontrol &
      ;;
    "brightness_up")
      brightnessctl set +5%
      ;;
    "brightness_down")
      brightnessctl set 5%-
      ;;
  esac
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

#  sleep 3 && xsetroot -name "$updates $(battery) $(brightness) $(cpu) $(mem) $(wlan) $(clock)"
# sleep 3 && xsetroot -name "$updates  $(cpu) $(mem) $(battery) $(brightness) $(clock) $(clock2)"
sleep 3 && xsetroot -name "$updates $(audio) $(cpu) $(mem) $(clock) $(clock2)"
done
