#!/usr/bin/env bash


  swayidle -w \
  timeout 300 'if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then $HOME/.config/hypr/lockscreen.sh; fi' \
  timeout 200 'if ! playerctl -p spotify,mpv,vlc,firefox,chromium status 2>/dev/null | grep -q Playing; then hyprctl dispatch dpms off; fi' \
  resume 'hyprctl dispatch dpms on && hyprctl dispatch dpms on' \  # Force DPMS re-enable (duplicated for reliability)
  before-sleep "$HOME/.config/hypr/lockscreen.sh" \
  after-resume 'hyprctl dispatch dpms on'  # Explicitly reset DPMS after wake
