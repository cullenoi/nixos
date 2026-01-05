{  config, pkgs,... }:
{
   imports = [
    # inputs.nixvim.homeManagerModules.nixvim 
    # ../config/nixvim/config/default.nix
    # ./neovim.nix
    # ./zsh.nix
    # ./programs
    # ./modules
    # ./services
    # ./themes
    # ./neovim.nix
   ];
      programs.nixvim.enable = true;
      programs.nixvim.imports = [ ../config/nixvim/config/default.nix];                      # 1. turn the module on

  # programs.nixvim = {
  #   enable = true;  
  #   # imports = [    
  #   #   ../config/nixvim/config/default.nix
  #   # ];
  #   /* ---------------------------------------------------------------
  #      2.  put / override any nixvim options here.
  #          (the files you imported will contribute their own
  #          programs.nixvim.* options; this block is merged with them.)
  #      --------------------------------------------------------------- */
  #   # colorscheme = "tokyonight";           # example
  #   vim.opt.number = true;                # example global vim option
  #   vim.opt.relativenumber = true;
  # };

  home.username = "cullenoi";
  home.homeDirectory = "/home/cullenoi";
  home.stateVersion = "25.05";

  #cheeky little 
  home.file.".config/dunst".source = ../config/dunst;
  home.file.".config/hypr".source = ../config/hypr;
  home.file.".config/waybar".source = ../config/waybar;
  home.file.".config/rofi".source = ../config/rofi;
  home.file.".config/ghostty".source = ../config/ghostty;
  # home.file.".config/neovim".source = ../config/nvim;
  # home.file."/etc/sddm.conf".source = ../config/sddm/sddm.conf;
  # home.file.".config/swww".source = ../config/swww;

  programs.home-manager.enable = true;
    # programs.nixvim.imports = [ ./nixvim.nix ];
  # programs.nixvim.enable = true;
  # programs.zsh.enable = true;
  # # Shell configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos#$(hostname)";
      update = "cd ~/nixos && nix flake update && sudo nixos-rebuild switch --flake .#$(hostname)";
    };
  };


  # User packages (available on ALL machines)
  home.packages = with pkgs; [
    vscode
    git
    vim
    tmux
    htop
    tree
    jq
    curl
    wget
    tig
    nano
  ];
  # programs.mangowc.enable = true;
# #   # Environment variables
# #   home.sessionVariables = {
# #     XCURSOR_THEME = "Bibata-Modern-Classic";
# #     XCURSOR_SIZE = "24";
# #     EDITOR = "nvim";
# #   };

#   # Git configuration
# #   programs.git = {
# #     enable = true;
# #     userName = "cullenoi";
# #     userEmail = "cullenoi@tcd.ie";
# #     extraConfig = {
# #       init.defaultBranch = "main";
# #       pull.rebase = false;
# #     };
# #   };


    
 
    
  

#   # Neovim configuration
#   programs.neovim = {
#     enable = true;
#     defaultEditor = true;
#     viAlias = true;
#     vimAlias = true;
#   };

#   # Starship prompt
#   programs.starship = {
#     enable = true;
#     enableZshIntegration = true;
#   };

#   # # Yazi file manager
#   # programs.yazi = {
#   #   enable = true;
#   # };

#   # GTK configuration
#   gtk = {
#     enable = true;
#     theme = {
#       name = "Adwaita";
#       package = pkgs.gnome-themes-extra;
#     };
#     iconTheme = {
#       name = "Adwaita";
#       package = pkgs.adwaita-icon-theme;
#     };
#     cursorTheme = {
#       name = "Bibata-Modern-Classic";
#       package = pkgs.bibata-cursors;
#     };
#   };


}

