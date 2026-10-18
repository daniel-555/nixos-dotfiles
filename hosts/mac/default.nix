{ pkgs, lib, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.efi.canTouchEfiVariables = lib.mkForce true;
}
