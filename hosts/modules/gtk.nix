{ config, pkgs, ... }:

{
  # ... other system configuration

  # 1. Install the cursor theme package
  # The 'catppuccin' theme might need custom packaging in NixOS,
  # but standard themes like 'vanilla-dmz' are readily available.
  environment.systemPackages = [
    pkgs.vanilla-dmz # Example package
    # You may need to fetch the catppuccin package if it's not in your channels
  ];

  # 2. Set the global X cursor theme environment variables
  environment.sessionVariables = {
    XCURSOR_THEME = "Vanilla-DMZ"; # Must match the theme folder name
    XCURSOR_SIZE = "24";
  };
  
  # 3. Configure GTK apps globally (ensures consistency)
  # This makes the cursor theme available to GTK settings daemons
  # Note: The exact GTK config options can vary by NixOS version/setup.
  # A common approach is using dconf or gsettings which are often handled
  # by display managers (GDM, LightDM) if you set them up correctly.

  # 4. For Hyprland, you still need the environment variables in your Hyprland config
  # as described in the previous message, or use the Home Manager approach for integration.
}
