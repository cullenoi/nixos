{ config, pkgs, ... }:


{

 programs = {
      zsh = {
          enable = true;
          enableAutosuggestions.enable = true;
          syntaxHighlighting.enable = true;
          oh-my-zsh = {
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