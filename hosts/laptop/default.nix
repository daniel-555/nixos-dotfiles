{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [
    "displaylink"
  ];

  environment.systemPackages = with pkgs; [
    displaylink
  ];

  services.flatpak.enable = true;
}
