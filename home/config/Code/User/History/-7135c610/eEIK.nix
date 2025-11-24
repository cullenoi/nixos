{ config, pkgs, ... }:

{
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;
  # Laptop-specific hardware
  imports = [ ./hardware-configuration.nix ];


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


  # Laptop power management
  services.upower.enable = true;
  services.tlp.enable = false;

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
#   users.defaultUserShell = pkgs.zsh;

  services.gnome.gnome-keyring.enable = true; 
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };
    console.keyMap = "uk";   

# Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
    services.flatpak.enable = true;
    security.polkit.enable = true;
    security.pam.services.swaylock = {};
    services.openssh.enable = true;
    powerManagement.enable = true;
    services.power-profiles-daemon.enable = true;
    #boot config
    # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;


    system.stateVersion = "24.11";
}