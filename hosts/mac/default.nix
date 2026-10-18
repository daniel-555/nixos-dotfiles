{ pkgs, lib, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./apple-silicon-support
  ];

  boot.loader.efi.canTouchEfiVariables = lib.mkForce false;
  networking.networkmanager.wifi.backend = lib.mkForce "iwd";

  hardware.asahi = {
    enable = true;
    peripheralFirmwareDirectory = ./vendorfw;
  };
}
