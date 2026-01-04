{ config, pkgs, inputs, lib, ... }:

{
  imports = [ ./modules/home ];
  home.username = "daniel";
  home.homeDirectory = "/home/daniel";

  home.packages = with pkgs; [
    neofetch
    neovim
    ripgrep
    fzf
    font-awesome
  ];

  # fonts.fontconfig.enable = true;

  xdg.configFile = {
    nvim.source = "${inputs.nvim-config}";
    # waybar.source = "${inputs.dotfiles}/.config/waybar";
    # kitty.source = ./kitty-temp-conf;
  };

  services.kanshi.enable = true;

  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      cursor_trail = 1;
      font_size = 16;
    };
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
