{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [
    "nvidia"
    "displaylink"
    "modesetting"
  ];

  environment.systemPackages = with pkgs; [ displaylink ];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
