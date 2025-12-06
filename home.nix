{ config, pkgs, inputs, ... }:

{
  imports = [ ./modules/home ];
  home.username = "daniel";
  home.homeDirectory = "/home/daniel";

  home.packages = with pkgs; [ neofetch neovim ripgrep fzf ];

  xdg.configFile = {
    nvim.source = "${inputs.nvim-config}";
    waybar.source = "${inputs.dotfiles}/.config/waybar";
    kitty.source = "${inputs.dotfiles}/.config/kitty";
  };

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Daniel Spiers";
        email = "danjspiers@gmail.com";
      };

      init.defaultBranch = "main";
    };
  };

  home.stateVersion = "25.11";
}
