{ config, pkgs, ... }:

{


users.defaultUserShell = pkgs.zsh;
environment.shells = with pkgs; [ zsh ];
programs = {
   zsh = {
      enable = true;
      autosuggestions.enable = true;
      zsh-autoenv.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
         enable = true;
         theme = "candy";
         plugins = [
           "git"
           "npm"
           "history"
           "node"
           "rust"
           "deno"
         ];
      };
   };
};
}

