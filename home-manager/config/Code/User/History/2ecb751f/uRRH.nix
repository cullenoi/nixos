{ config, pkgs, ... }:
{
  imports = [
    ./dev.nix
  ];
  
  home.packages = with pkgs; [
    # Terminal
    ghostty
    starship
    #code
    vim
    nvim
    code
    #packages
    ripgrep
    fd
  ];
}