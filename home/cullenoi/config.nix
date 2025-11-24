# let configDir = ../config;
# in
# {



#     xdg.configFile = {
#     # GTK configs
#     ".config/gtk-4.0/gtk.css".source = "${configDir}/gtk-4.0/gtk.css";
#     ".config/gtk-4.0/settings.ini".source = "${configDir}/gtk-4.0/settings.ini";
    
#     # Desktop environment configs
#     ".config/nvim".source = "${configDir}/nvim";
#     ".config/wallpapers".source = "${configDir}/wallpapers";
#     ".config/ghostty".source = "${configDir}/ghostty";
#     ".config/neofetch".source = "${configDir}/neofetch";
#     ".config/hypr".source = "${configDir}/hypr";
#     ".config/swayidle".source = "${configDir}/swayidle";
#     ".config/swaylock".source = "${configDir}/swaylock";
#     ".config/wlogout".source = "${configDir}/wlogout";
#     ".config/waybar".source = "${configDir}/waybar";
#     ".config/btop".source = "${configDir}/btop";
#     ".config/wofi".source = "${configDir}/wofi";
#     ".config/mako".source = "${configDir}/mako";
    
#     # GTK config file
#     ".gtkrc-2.0".source = "${configDir}/.gtkrc-2.0";
#   };
#   home.file = {
#     # GTK configs
#     ".config/gtk-4.0/gtk.css".source = "${configDir}/gtk-4.0/gtk.css";
#     ".config/gtk-4.0/settings.ini".source = "${configDir}/gtk-4.0/settings.ini";
    
#     # Desktop environment configs
#     ".config/nvim".source = "${configDir}/nvim";
#     ".config/wallpapers".source = "${configDir}/wallpapers";
#     ".config/ghostty".source = "${configDir}/ghostty";
#     ".config/neofetch".source = "${configDir}/neofetch";
#     ".config/hypr".source = "${configDir}/hypr";
#     ".config/swayidle".source = "${configDir}/swayidle";
#     ".config/swaylock".source = "${configDir}/swaylock";
#     ".config/wlogout".source = "${configDir}/wlogout";
#     ".config/waybar".source = "${configDir}/waybar";
#     ".config/btop".source = "${configDir}/btop";
#     ".config/wofi".source = "${configDir}/wofi";
#     ".config/mako".source = "${configDir}/mako";
    
#     # GTK config file
#     ".gtkrc-2.0".source = "${configDir}/.gtkrc-2.0";
#   };
# }

let configDir = ../config;
in
{
  xdg.configFile = {
    # GTK configs
    "gtk-4.0/gtk.css".source = "${configDir}/gtk-4.0/gtk.css";
    "gtk-4.0/settings.ini".source = "${configDir}/gtk-4.0/settings.ini";
    
    # Desktop environment configs
    "nvim".source = "${configDir}/nvim";
    "wallpapers".source = "${configDir}/wallpapers";
    "ghostty".source = "${configDir}/ghostty";
    "neofetch".source = "${configDir}/neofetch";
    "hypr".source = "${configDir}/hypr";
    "swayidle".source = "${configDir}/swayidle";
    "swaylock".source = "${configDir}/swaylock";
    "wlogout".source = "${configDir}/wlogout";
    "waybar".source = "${configDir}/waybar";
    "btop".source = "${configDir}/btop";
    "wofi".source = "${configDir}/wofi";
    "mako".source = "${configDir}/mako";
  };

  # GTK config file with force option
  home.file.".gtkrc-2.0" = {
    source = "${configDir}/.gtkrc-2.0";
    force = true;
  };
}