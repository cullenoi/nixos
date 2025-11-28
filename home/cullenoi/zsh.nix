{ config, pkgs, ... }:

{
  # 1. Enable zsh program
  programs.zsh.enable = true;

  # 2. Configure Oh My Zsh
  programs.zsh.ohMyZsh = {
    enable = true;
    # Set your desired theme
    theme = "robbyrussell";
    # Add plugins (e.g., git, zsh-autosuggestions, etc.)
    plugins = [ "git" "sudo" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
  };

  # 3. Enable useful zsh features (optional but recommended)
  programs.zsh.enableBashCompletion = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;

  # 4. Set zsh as the default user shell
  # This makes sure that your user account uses zsh when logging in.
  # If you are on NixOS, this is typically done in your NixOS configuration.nix
  # by setting users.users.<your-username>.shell = pkgs.zsh;
  # In standalone Home Manager, this might not be needed if already set at the system level.
}