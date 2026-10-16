{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [
    "amdgpu"
  ];

  environment.systemPackages = with pkgs; [
    parsec-bin
    spotify
    vscodium
    alacritty
  ];
}
