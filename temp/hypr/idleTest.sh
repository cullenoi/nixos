#!/usr/bin/env bash


# swayidle -w \
#   timeout 3 'bash -c "if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then $HOME/.config/hypr/lockscreen.sh; fi"' \
#   timeout 4 'bash -c "if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then hyprctl dispatch dpms off; fi"' \
#   resume 'hyprctl dispatch dpms on' \
#   before-sleep '$HOME/.config/hypr/lockscreen.sh'

swayidle \
  timeout 3 'if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then $HOME/.config/hypr/lockscreen.sh; fi' \
  timeout 5 'if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then hyprctl dispatch dpms off; fi' \
  resume 'hyprctl dispatch dpms on && sleep 0.5 && hyprctl dispatch dpms on && wtype -P shift' \
  before-sleep "$HOME/.config/hypr/lockscreen.sh" \
  after-resume 'hyprctl dispatch dpms on'
