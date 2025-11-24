{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/laptop
          ./modules/programs/development.nix
          ./modules/services/pipewire.nix
          ./modules/services/printing.nix
          ./modules/services/networking.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cullenoi = import ./home-manager/default.nix;
          }
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/desktop
          ./modules/programs/steam.nix
          ./modules/programs/gaming.nix
          ./modules/programs/desktop.nix
          ./modules/programs/development.nix
          ./modules/services/pipewire.nix
          ./modules/services/printing.nix
          ./modules/services/networking.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cullenoi = import ./home-manager/default.nix;
          }
        ];
      };

      work = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/work
          ./modules/programs/development.nix
          ./modules/programs/desktop.nix
          ./modules/services/pipewire.nix
          ./modules/services/printing.nix
          ./modules/services/networking.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cullenoi = import ./home-manager/default.nix;
          }
        ];
      };
    };
  };
}