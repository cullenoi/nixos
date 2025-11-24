{ config, pkgs, ... }:

{
  home.username = "cullenoi";
  home.homeDirectory = "/home/cullenoi";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  # Packages that should be available to your user
  home.packages = with pkgs; [
    
    # Music
    spotify

    # Editors & Dev Tools
    vscode
    git
    ripgrep
    fd
    gcc
    meson
    
    # Screenshot & Utilities
    hyprshot
    slurp
    wget
    htop
    busybox
    scdoc
    mpv
    
    # Rice & Desktop
    playerctl
    bibata-cursors
    waybar
    adwaita-icon-theme
    polkit_gnome
    gnome-keyring
    power-profiles-daemon
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    swayidle
    swaylock-effects
    upower
    dunst
    libnotify
    swww
    ghostty
    rofi-wayland
    signaldctl
    networkmanagerapplet
    pavucontrol
    starship
    lutris
    
    # Terminal & Shell
    nerdfonts
    meslo-lgs-nf
    
    # File Manager
    yazi
  ];

  # Environment variables
  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    EDITOR = "nvim";
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Cullen O";
    userEmail = "cullen@example.com"; # Change this!
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };


  # Neovim configuration
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Starship prompt
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    # Add your starship config here or use the default
  };

  # Yazi file manager configuration
  programs.yazi = {
    enable = true;
    # Add your yazi config here
  };

  # Browser configurations
  programs.firefox = {
    enable = true;
    # Add your Firefox preferences here
  };

  # GTK configuration (for theming)
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };

  # Services
  services = {
    # Network Manager applet
    network-manager-applet.enable = true;
    
    # Bluetooth applet (useful for laptops)
    blueman-applet.enable = true;
  };

  # XDG configuration
  xdg = {
    enable = true;
    configHome = "${config.home.homeDirectory}/.config";
    
    # MIME applications
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = [ "firefox.desktop" ];
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "x-scheme-handler/about" = [ "firefox.desktop" ];
        "x-scheme-handler/unknown" = [ "firefox.desktop" ];
      };
    };
  };

  # Dotfiles and custom configurations
  home.file = {
    # Example: Custom scripts
    ".local/bin/my-script".source = ./scripts/my-script.sh;
    
    # Example: Custom configuration files
    ".config/my-app/config".text = ''
      # Your custom config
    '';
  };
}