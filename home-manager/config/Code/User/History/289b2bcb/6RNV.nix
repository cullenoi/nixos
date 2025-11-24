{ config, pkgs, ... }:
{
  imports = [
    ./dev
  ]
  home.packages = with pkgs; [
    # Desktop utilities
    playerctl
    bibata-cursors
    waybar
    adwaita-icon-theme
    
    # Wayland
    meson
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    
    # Lock screen
    swayidle
    swaylock-effects
    
    # Power management
    upower
    acpi
    polkit_gnome
    gnome-keyring
    power-profiles-daemon
    
    # Notifications
    dunst
    libnotify
    
    # Wallpaper
    swww
    
    # Terminal
    ghostty
    
    # App launcher
    rofi
    
    
    # Audio
    pavucontrol
    
    # Shell
    starship
    
    # Gaming
    lutris
    
    # File manager
    yazi
    
    # Development
    ripgrep
    fd
  ];
}