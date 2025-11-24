# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./home.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  services.gnome.gnome-keyring.enable = true;  # For GNOME keyring
  programs.nm-applet.enable = true;  # Auto-starts nm-applet with systray support  
# Set your time zone.
  time.timeZone = "Europe/Dublin";

  # Select internationalisation properties.
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

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
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

   security.polkit.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cullenoi = {
    isNormalUser = true;
    description = "cullenoi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  security.pam.services.swaylock = {};
  
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };
  # List packages installed in system profile. To search, run:
  nixpkgs.config.allowUnfree = true;
 
   environment.systemPackages = with pkgs; [
  
   kleopatra
   pinentry
    gnupg  
   #BROWSER
   tor
   ungoogled-chromium
   firefox
   tor-browser
   #MUSIC
   spotify
   electrum   
   #Editors
#   neovim
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
#   vi
   vscode  
   git
#screenshot
   hyprshot
   slurp   
   #Common Utilities:
   wget
   htop
   busybox 
   scdoc
   mpv
   gcc
   #Code libs
   #Rice
   playerctl
   bibata-cursors
   waybar
   adwaita-icon-theme #cursor
#DEEPSEEK SUG
  acpi
  polkit_gnome
  gnome-keyring  # Often needed for proper power management
  power-profiles-daemon  # For power management
  meson
  wayland-protocols
  wayland-utils
  wl-clipboard
  wlroots 
  #Lock screen
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
 #vim
   ripgrep
   fd

 ];
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

services.upower.enable = true;
powerManagement.enable = true;
services.power-profiles-daemon.enable = true;

  # List services that you want to enable:
  programs.neovim = {
  enable = true;
  defaultEditor = true;
  };
  #STEAM 4 gamin
 


 programs.steam.enable = true; 

#Font
fonts.packages = with pkgs; [
  nerdfonts
  meslo-lgs-nf
];

#TERMINAL
  programs = {
   zsh = {
      enable = true;
      autosuggestions.enable = true;
      zsh-autoenv.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
         enable = true;
         theme = "robbyrussell";
         plugins = [
           "git"
           "npm"
           "history"
           "node"
           "rust"
           "deno"
         ];
      };
   };
};

#Global env variables:
environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic"; # Or your chosen theme
    XCURSOR_SIZE = "24";                     # Adjust to your preferred size
  };

#file manager
programs.yazi = {
  enable = true;
  # There are more options available:
  # https://search.nixos.org/options?channel=unstable&type=packages&query=programs.yazi
};


#waybar
nixpkgs.overlays = [
  (self: super: {
    waybar = super.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
  })
];

users.defaultUserShell = pkgs.zsh;

  #FLAKES
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
    services.flatpak.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
