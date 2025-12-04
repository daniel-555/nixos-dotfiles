{ config, pkgs, inputs, ... }:

{
  imports = [ ./modules/home ];
  home.username = "daniel";
  home.homeDirectory = "/home/daniel";

  home.packages = with pkgs; [ neofetch neovim ripgrep fzf ];

  xdg.configFile = {
    nvim.source = "${inputs.nvim-config}";
    hypr.source = "${inputs.dotfiles}/.config/hypr";
    waybar.source = "${inputs.dotfiles}/.config/waybar";
    kitty.source = "${inputs.dotfiles}/.config/kitty";
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
    userName = "Daniel Spiers";
    userEmail = "danjspiers@gmail.com";
    extraConfig = { init.defaultBranch = "main"; };
  };

  home.stateVersion = "25.05";
}
