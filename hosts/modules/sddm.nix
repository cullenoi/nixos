{ config, pkgs, ... }:

let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
  };

in {
  services = {
    xserver.enable = true;

    displayManager = {
      sddm = {
        enable        = true;
        wayland.enable = true;          # keep your existing line
        package       = pkgs.kdePackages.sddm; # or just pkgs.sddm
        theme = "sddm-astronaut-theme";
        settings = {
          Theme = {
          Current = "sddm-astronaut-theme";
        # CursorTheme = "Bibata-Modern-Ice";
        # CursorSize = 24;
          };
        };
        extraPackages = with pkgs; [
          custom-sddm-astronaut
        ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    custom-sddm-astronaut
    kdePackages.qtmultimedia
  ];
}