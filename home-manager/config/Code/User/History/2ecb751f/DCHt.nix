{ config, pkgs, ... }:
{
  
  
  home.packages = with pkgs; [
    # Terminal
    ghostty
    starship
    #code
    vim
    neovim
    code
    #utils
    gcc
    #packages
    ripgrep
    fd
  ];
}