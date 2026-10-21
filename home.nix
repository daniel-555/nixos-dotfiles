{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [ ./modules/home ];
  home.username = "daniel";
  home.homeDirectory = "/home/daniel";

  home.packages = with pkgs; [
    fastfetch
    ripgrep
    fzf
    font-awesome
  ]; # neovim

  fonts.fontconfig.enable = true;

  services.kanshi.enable = true;

  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      remember_window_size = "no";
      enable_audio_bell = "no";
      cursor_trail = 1;
      font_size = 15;
    };
  };

  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";
    };
  };

  home.stateVersion = "26.05";
}
