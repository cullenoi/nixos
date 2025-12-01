{pkgs, ...}: 
 {
  environment.systemPackages = [pkgs.sddm-astronaut];
  services = {
    xserver.enable = true;

    displayManager = {
      sddm = {
        wayland.enable = true;
        enable = true;
        package = pkgs.kdePackages.sddm;

        theme = "sddm-astronaut";
        extraPackages = [
          pkgs.sddm-astronaut
        ];
      };
      autoLogin = {
        enable = false;
        user = "shawn";
      };
    };
  };
}