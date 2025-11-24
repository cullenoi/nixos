#!/usr/bin/env bash
# On startup: wallpaper, network applet, bar, notifications, idle daemon

# Start wallpaper daemon
swww init &

# Set wallpaper
swww img ~/Pictures/Wallpapers/tea.png &

# Start network manager applet
nm-applet --indicator &

# Start waybar
waybar &

# Start notification daemon
dunst &

# Start swayidle (IMPORTANT: must be backgrounded)
swayidle -w \
  timeout 300 'swaylock -f -c 000000' \
  timeout 600 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  before-sleep 'swaylock -f -c 000000' &
