#!/usr/bin/env bash
# On startup: wallpaper, network applet, bar, notifications, idle daemon

# Start wallpaper daemon
swww-daemon &
swww img ~/Pictures/Wallpapers/tea.png &

# Set wallpaper

# Start network manager applet
nm-applet --indicator &

# Start waybar
waybar &

# Start notification daemon
dunst &

# Start swayidle (IMPORTANT: must be backgrounded)
# swayidle -w \
  # timeout 300 "$HOME/.config/hypr/lockscreen.sh" \
  # timeout 400 'hyprctl dispatch dpms off' \
  # resume 'hyprctl dispatch dpms on' \
  # before-sleep "$HOME/.config/hypr/lockscreen.sh"

# swayidle -w \
  # timeout 300 'if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then $HOME/.config/hypr/lockscreen.sh; fi' \
  # timeout 300 'if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then hyprctl dispatch dpms off; fi' \
  # resume 'hyprctl dispatch dpms on' \
  # before-sleep "$HOME/.config/hypr/lockscreen.sh"


  swayidle -w \
  # timeout 300 'if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then $HOME/.config/hypr/lockscreen.sh; fi' \
  # timeout 200 'if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then loginctl lock-session; sleep 1; hyprctl dispatch dpms off; fi' \
  # resume 'hyprctl dispatch dpms on && hyprctl dispatch dpms on' \  # Double dispatch helps some monitors
  # before-sleep "$HOME/.config/hypr/lockscreen.sh"

  swayidle -w \
  timeout 300 'if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then $HOME/.config/hypr/lockscreen.sh; fi' \
  timeout 400 'if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then hyprctl dispatch dpms off; fi' \
  resume 'hyprctl dispatch dpms on && hyprctl dispatch dpms on' \  # Force DPMS re-enable (duplicated for reliability)
  before-sleep "$HOME/.config/hypr/lockscreen.sh" \
  after-resume 'hyprctl dispatch dpms on'  # Explicitly reset DPMS after wake