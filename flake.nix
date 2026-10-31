{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    stylix.url = "github:danth/stylix/release-26.05";
    nixvim.url = "github:nix-community/nixvim/nixos-26.05";

    nixos-hardware = {
      url = "github:nixos/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-hardware,
      ...
    }@inputs:
    let
      mkConfig =
        host: system:
        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs;
            inherit host;
          };
          modules = [
            ./configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                users.daniel = import ./home.nix;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ]
          ++ (if host == "laptop" then [ nixos-hardware.nixosModules.lenovo-thinkpad-t480 ] else [ ]);
        };

    in
    {
      nixosConfigurations = {
        home = mkConfig "home" "x86_64-linux";
        work = mkConfig "work" "x86_64-linux";
        laptop = mkConfig "laptop" "x86_64-linux";
      };
    };
}
