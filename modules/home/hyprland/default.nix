{ ... }:
let
  shared = {
    mod = "ALT";
    terminal = "kitty";
    browser = "brave";
    programRunner = "rofi-launcher";
  };
in
{
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./binds.nix
  ];

  _module.args.shared = shared;
}
