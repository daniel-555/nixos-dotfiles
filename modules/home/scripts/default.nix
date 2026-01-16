{ pkgs, ... }:
{
  home.packages = [
    (import ./rofi-launcher.nix { inherit pkgs; })
    (import ./sessionizer.nix { inherit pkgs; })
  ];
}
