{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager	= {
	url = "github:nix-community/home-manager/release-25.05";
	inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-config = {
	url = "github:daniel-555/nvim-configs";
	flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, nvim-config, ... }@inputs: {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		modules = [
			./configuration.nix
			home-manager.nixosModules.home-manager {
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				
				home-manager.users.daniel = import ./home.nix;
				home-manager.extraSpecialArgs = { inherit inputs; };
			}
		];
	};
  };
}
