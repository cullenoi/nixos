{ config, pkgs, ... }:
{
   imports = [
    # ./programs
    # ./services
    # ./themes
   ];
  home.username = "cullenoi";
  home.homeDirectory = "/home/cullenoi";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
   
       #TERMINAL
   # ZSH configuration - CORRECTED
  # Shell configuration
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
    userEmail = "cullen@example.com";
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
  };

  # Yazi file manager
  programs.yazi = {
    enable = true;
  };

  # GTK configuration
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
    network-manager-applet.enable = true;
  };
}

