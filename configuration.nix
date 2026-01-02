# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, host, pkgs, ... }:

{
  imports =
    [ ./hosts/${host} ./modules/core inputs.stylix.nixosModules.stylix ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    plymouth.enable = true;
  };

  networking.hostName = "${host}";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  users.users.daniel = {
    isNormalUser = true;
    description = "daniel";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ ];
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  stylix = {
    enable = true;

    opacity.terminal = 0.8;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
    };

    polarity = "dark";
    targets = {
      console.enable = false;
      plymouth.enable = false;
    };
    image = ./wallpapers/retrowave-sunset.jpg;
  };

  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      dejavu_fonts
      fira-code
      fira-code-symbols
      font-awesome
      hackgen-nf-font
      ibm-plex
      inter
      jetbrains-mono
      material-icons
      maple-mono.NF
      minecraftia
      nerd-fonts.im-writing
      nerd-fonts.blex-mono
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-monochrome-emoji
      powerline-fonts
      roboto
      roboto-mono
      symbola
      terminus_font
    ];
  };

  # services.getty.autologinUser = "daniel";

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
    brave
  ];

  environment.variables = { EDITOR = "nvim"; };

  programs.ssh.startAgent = true;
  programs.ssh.agentTimeout = "1h";

  system.stateVersion = "25.11";

}
