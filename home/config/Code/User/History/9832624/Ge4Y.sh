#!/usr/bin/env bash


# swayidle -w \
#   timeout 3 'bash -c "if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then $HOME/.config/hypr/lockscreen.sh; fi"' \
#   timeout 4 'bash -c "if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then hyprctl dispatch dpms off; fi"' \
#   resume 'hyprctl dispatch dpms on' \
#   before-sleep '$HOME/.config/hypr/lockscreen.sh'


  swayidle -w \
  timeout 3 'if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then $HOME/.config/hypr/lockscreen.sh; fi' \
  timeout 5 'if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then hyprctl dispatch dpms off || hyprctl keyword monitor "eDP-1, disable"; fi' \
  resume 'hyprctl dispatch dpms on || hyprctl keyword monitor "eDP-1, enable"' \
  before-sleep '$HOME/.config/hypr/lockscreen.sh'