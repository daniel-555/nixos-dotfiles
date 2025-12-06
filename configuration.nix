# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  users.users.daniel = {
    isNormalUser = true;
    description = "daniel";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ ];
  };

  programs.hyprland.enable = true;

  # services.getty.autologinUser = "daniel";
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    # settings.X11 = {
    #   XkbLayout = "us";
    #   XkbOptions = "caps:escape";
    # };
  };

  # systemd.services.display-manager.environment = {
  #   XKB_DEFAULT_LAYOUT = "us";
  #   XKB_DEFAULT_OPTIONS = "caps:escape";
  # };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    neovim
    git
    vim
    wget
    gcc
    kitty
    waybar
    hyprpaper
    wl-clipboard-rs
  ];

  environment.variables = { EDITOR = "nvim"; };

  programs.ssh.startAgent = true;
  programs.ssh.agentTimeout = "1h";

  system.stateVersion = "25.05";

}
