{ config, pkgs, inputs, ... }:

{
	home.username = "daniel";
	home.homeDirectory = "/home/daniel";
	
	home.packages = with pkgs; [
		neofetch
		neovim
		ripgrep
		fzf
	];

	xdg.configFile = {
		nvim.source = "${inputs.nvim-config}";
	};

	
	programs.git = {
		enable = true;
		userName = "daniel";
		userEmail = "daniel@example.com";
        extraConfig = {
            init.defaultBranch = "main";
        };
	};


	home.stateVersion = "25.05";
}
