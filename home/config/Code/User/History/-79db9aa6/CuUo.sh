#!/usr/bin/env bash
#On startup setups the walpaper daemon etc

swww init&

swww img ~/Pictures/Wallpapers/tea.png

#network manager
nm-applet --indicator &

waybar &

dunst

exec-once = swayidle -w \
  timeout 360 'hyprlock' \
  before-sleep 'hyprlock'