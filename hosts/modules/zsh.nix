{ config, pkgs, ... }:

{

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.ohMyZsh.enable = true;
  environment.systemPackages = with pkgs; [
  zsh
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
];
  programs.zsh = {
    enable = true;
    # ohMyZsh = {
    #   enable = true;
    #   plugins = [ "git" "sudo" "docker" "npm" "node" ];
    #   theme = "robbyrussell";
    # };
  };
}

