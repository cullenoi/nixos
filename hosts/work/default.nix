{ config, pkgs, ... }:

{
 
  networking.hostName = "work";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 5000 ];   # open 5000/tcp
    # allowedUDPPorts = [ ];     # add UDP here if you ever need it
    trustedInterfaces = [ "tailscale0" ];
    # allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];
    # let you SSH in over the public internet
    # networking.firewall.allowedTCPPorts = [ 22 ];
  };  
  # Work-specific hardware
  imports = [ ./hardware-configuration.nix
  ../modules/bootloader.nix
  # ../modules/lazyvim.nix
  ../modules/hyprland.nix
  ../modules/zsh.nix
  ../modules/sddm.nix
  ../modules/theme.nix];


  hardware.keyboard.qmk.enable = true;
  hardware.bluetooth.enable = true; 
  # Bootloader
  # boot.loader.grub = {
  #   enable = true;
  #   device = "/dev/nvme0n1";
  #   useOSProber = true;
  # };


  # services.xserver = {
  #   enable = true;
  #   displayManager = {
  #     lightdm.enable = false;
  #     sddm = {
  #       enable = true;
  #       wayland.enable = true;  
  #       theme = "catppuccin-macchiato";
  #     };
  #   };
  # };
  # Time and locale
  time.timeZone = "Europe/Dublin";
  i18n.defaultLocale = "en_IE.UTF-8";
  
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Keymaps
  services.xserver.xkb.layout = "gb";
  console.keyMap = "uk";

  # User account
  users.users.cullenoi = {
    isNormalUser = true;
    description = "cullenoi";
    extraGroups = [ "networkmanager" "wheel" "wireshark" ];
    shell = pkgs.zsh;
  };

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  
  # Default shell

  # Fonts
  fonts.packages = with pkgs; [
  nerd-fonts.meslo-lg
  ];
  # programs.mangowc.enable = true;
  # Environment variables

  # XDG portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Security
  security.polkit.enable = true;
  security.pam.services.swaylock = {};

  programs.firefox.enable = true;
  programs.neovim.enable = true;

####

## keyring:
services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = with pkgs; [
    #lazyvim
    # neovim
    #
    tree
    vim
    wget
    #Setup specific
    catppuccin-sddm
    bibata-cursors
    avizo
    wlogout
    dunst
    waybar
    networkmanagerapplet
    ghostty
    catppuccin-cursors.macchiatoTeal
    kdePackages.dolphin
    rofi
    starship
    brightnessctl
    #work related
    tailscale
    teams-for-linux
    bitwarden-desktop
    wireshark
    dsniff
    screen
    segger-jlink #CVE has to be called at this level so it doesnt afffect CT4
    # segger-jlink-qt4-874
    gcc-arm-embedded
    cmake
    ninja
    dpkg
    via
    vial
    brave
    unzip
    minicom
    # alsa-notify
    usbutils
    blueman
    libreoffice-qt
    hunspell
    hunspellDicts.uk_UA
    hunspellDicts.th_TH
    #
  ];
  services.udev.packages = [ pkgs.via ];
  programs.wireshark.enable = true;
  programs.thunderbird.enable = true;
##FOR ITS OWN CONFIG FILE LATER
  nixpkgs.config.permittedInsecurePackages = [
                  "segger-jlink-qt4-810"
                ];
  nixpkgs.config.segger-jlink.acceptLicense = true;#WORK around to allow segger by nix devs
  services.tailscale.enable = true;
  services.udev.extraRules = ''
    # SEGGER J-Link (vendor 1366)
    SUBSYSTEM!="usb", GOTO="jlink_rules_end"
    ATTRS{idVendor}=="1366", MODE="0666"
    LABEL="jlink_rules_end"
  '';
  system.stateVersion = "25.05"; # Did you read the comment?

}