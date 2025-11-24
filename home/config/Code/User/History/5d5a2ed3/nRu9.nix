{
  description = "Quanchobi's NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Add other inputs as needed
  };

  outputs = { nixpkgs, home-manager, agenix, ... }: {
    nixosConfigurations = {
      # Desktop configuration
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host/desktop
          home-manager.nixosModules.home-manager
          agenix.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.anderson = import ./home/anderson;
          }
        ];
      };

      # Laptop configuration
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host/laptop
          home-manager.nixosModules.home-manager
          agenix.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.anderson = import ./home/anderson;
          }
        ];
      };
    };
  };
}
