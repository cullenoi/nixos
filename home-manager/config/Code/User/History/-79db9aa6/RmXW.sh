#!/usr/bin/env bash
# On startup: wallpaper, network applet, bar, notifications, idle daemon

# Start wallpaper daemon
swww img ~/Pictures/Wallpapers/tea.png &
swww-daemon &

# Set wallpaper

# Start network manager applet
nm-applet --indicator &

# Start waybar
waybar &

# Start notification daemon
dunst &

# Start swayidle (IMPORTANT: must be backgrounded)
exec-once = swayidle -w \
  timeout 300 "$HOME/.config/hypr/lockscreen.sh" \
  timeout 600 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  before-sleep "$HOME/.config/hypr/lockscreen.sh"

