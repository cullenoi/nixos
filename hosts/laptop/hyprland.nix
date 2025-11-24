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

    # (pkgs.waybar.overrideAttrs (oldAttrs: {
    #     mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    #   })
    # )
    
    #Global env variables:
    # environment.variables = {
        # XCURSOR_THEME = "Bibata-Modern-Classic"; # Or your chosen theme
        # XCURSOR_SIZE = "24";                     # Adjust to your preferred size
    # };
    
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



}