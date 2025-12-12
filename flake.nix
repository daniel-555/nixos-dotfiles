{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    stylix.url = "github:danth/stylix/release-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim-config = {
      url = "github:daniel-555/nvim-configs";
      flake = false;
    };

    # dotfiles = {
    #   url = "git+ssh://git@github.com/daniel-555/dotfiles?ref=main";
    #   flake = false;
    # };
  };

  outputs = { self, nixpkgs, home-manager, nvim-config, ... }@inputs:
    let
      mkConfig = host:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; inherit host; };
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
          ];
        };

    in {
      nixosConfigurations = {
        home = mkConfig "home";
        work = mkConfig "work";
      };
    };
}
