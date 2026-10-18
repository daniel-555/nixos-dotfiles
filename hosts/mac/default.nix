{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.efi.canTouchEfiVariables = lib.mkForce false;
  networking.networkmanager.wifi.backend = lib.mkForce "iwd";

  hardware.asahi = {
    enable = true;
    peripheralFirmwareDirectory = ./vendorfw;
    avd.enable = false;
  };
}
