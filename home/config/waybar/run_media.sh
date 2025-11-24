#!/usr/bin/env bash
# Wrapper to run media player inside nix-shell with correct env

export DBUS_SESSION_BUS_ADDRESS=${DBUS_SESSION_BUS_ADDRESS}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR}

exec nix-shell ~/.config/waybar/shell.nix --run "$HOME/.config/waybar/mediaplayer.py --enable-logging -vv"
