{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    # nixvim.url = "github:dc-tec/nixvim";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixvim = {
        url = "github:nix-community/nixvim";
        # url = "github:dc-tec/nixvim";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
    };


  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./hosts/laptop
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cullenoi = import ./home-manager/cullenoi/default.nix;
          }
        ];
      };
      
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./hosts/desktop
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
          home-manager.nixosModules.home-manager
          # nixvim
          # nixvim.nixosModules.nixvim
          {

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # home-manager.users.cullenoi = import ./home/cullenoi/default.nix;
            home-manager.users.cullenoi = { pkgs, ... }: {
              imports = [
                ./home/cullenoi/default.nix        # your existing file
                nixvim.homeManagerModules.nixvim
              ];
            };
          }
        ];
      };
    };
  };
}