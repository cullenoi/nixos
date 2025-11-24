{ config, pkgs, ... }:

{
    programs.hyprland = {
        enable = true;

        xwayland = {
            enable = true;
        };

        portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
    
    environment.systemPackages = with pkgs; [
      hyprpaper
      libnotify
      mako
      qt5.qtwayland
      qt6.qtwayland
      swayidle
      swaylock-effects
      wlogout
      wl-clipboard
      wofi
    #  waybar
    ];
}