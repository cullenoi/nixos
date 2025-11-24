{ config, pkgs, ... }:

{
  networking.hostName = "laptop";

  # Laptop-specific hardware
  imports = [ ./hardware-configuration.nix ];

  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1";
    useOSProber = true;
  };

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

  # Laptop power management
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.tlp.enable = true;

  # User account
  users.users.cullenoi = {
    isNormalUser = true;
    description = "cullenoi";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Default shell
  users.defaultUserShell = pkgs.zsh;

  # Fonts
  fonts.packages = with pkgs; [
    nerdfonts
    meslo-lgs-nf
  ];

  # Environment variables
  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };

  # XDG portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Security
  security.polkit.enable = true;
  security.pam.services.swaylock = {};

  # Laptop-specific packages
  environment.systemPackages = with pkgs; [
    acpi
    powertop
    tlp
  ];
}