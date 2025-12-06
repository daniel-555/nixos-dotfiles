{ config, pkgs, inputs, ... }:

{
  imports = [ ./modules/home ];
  home.username = "daniel";
  home.homeDirectory = "/home/daniel";

  home.packages = with pkgs; [ neofetch neovim ripgrep fzf ];

  xdg.configFile = {
    nvim.source = "${inputs.nvim-config}";
    # hypr.source = "${inputs.dotfiles}/.config/hypr";
    waybar.source = "${inputs.dotfiles}/.config/waybar";
    kitty.source = "${inputs.dotfiles}/.config/kitty";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = null;
    portalPackage = null;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };
    settings = {
      "$terminal" = "kitty";
      "$mod" = "SUPER";
      bind = [ "$mod, Q, exec, $terminal" ];
      input = {
        kb_layout = "us";
        kb_options = [ "caps:swapescape" ];
        numlock_by_default = true;
        repeat_delay = 300;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          scroll_factor = 0.8;
        };
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Daniel Spiers";
    userEmail = "danjspiers@gmail.com";
    extraConfig = { init.defaultBranch = "main"; };
  };

  home.stateVersion = "25.05";
}
