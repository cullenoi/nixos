{ config, pkgs, ... }:
{
  
  
  home.packages = with pkgs; [
    # Terminal
    ghostty
    starship
    #code
    vim
    nvim
    code
    #utils
    gcc
    #packages
    ripgrep
    fd
  ];
}