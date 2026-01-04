{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cargo
    luajitPackages.luarocks-nix
    lua
  ];
}
