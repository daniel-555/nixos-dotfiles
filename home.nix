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

    programs.bash = {
        enable = true;
        profileExtra = ''
            if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
                exec uwsm start -S hyprland-uwsm.desktop
            fi
        '';
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
