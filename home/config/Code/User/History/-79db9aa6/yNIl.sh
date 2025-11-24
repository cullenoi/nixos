#!/usr/bin/env bash
#On startup setups the walpaper daemon etc

swww init&

swww img ~/Pictures/Wallpapers/tea.png

#network manager
nm-applet --indicator &

waybar &

dunst

exec = swayidle -w \
  timeout 300 'swaylock -f -c 000000' \
  timeout 600 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  before-sleep 'swaylock -f -c 000000'

#exec-once = swayidle -w \
 # timeout 360 'hyprlock' \
  #before-sleep 'hyprlock'
