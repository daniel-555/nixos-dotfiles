{ ... }: {
  imports = [
    ./nixvim.nix
    ./rofi.nix
    ./hyprland
    ./waybar.nix
    ./stylix.nix
    ./scripts
  ]; # ./nvim.nix
}
