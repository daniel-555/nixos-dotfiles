{
  inputs,
  host,
  pkgs,
  config,
  ...
}:

{
  imports = [
    ./hosts/${host}
    ./modules/core
    inputs.stylix.nixosModules.stylix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    plymouth.enable = true;
  };

  virtualisation = {
    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
      };
    };

    # libvirtd = {
    #   enable = true;
    #   qemu.vhostUserPackages = [ pkgs.virtiofsd ];
    # };
    # spiceUSBRedirection.enable = true;

    # docker.enable = true;
  };

  # programs.virt-manager.enable = true;

  services.usbmuxd.enable = true;

  networking.hostName = "${host}";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  users = {
    defaultUserShell = pkgs.zsh;
    users.daniel = {
      isNormalUser = true;
      description = "daniel";
      extraGroups = [
        "docker"
        "libvirtd"
        "networkmanager"
        "wheel"
        "vboxusers"
        "vboxsf"
      ];
      packages = [ ];
    };
  };

  boot = {
    extraModulePackages = [ config.boot.kernelPackages.evdi ];
    initrd = {
      kernelModules = [ "evdi" ];
    };
  };

  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        ControllerMode = "bredr";
      };
    };
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.zsh.enable = true;

  # services.getty.autologinUser = "daniel";

  # systemd.services.display-manager.environment = {
  #   XKB_DEFAULT_LAYOUT = "us";
  #   XKB_DEFAULT_OPTIONS = "caps:escape";
  # };

  programs.firefox.enable = true;
  programs.java.enable = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib
      libgcc
    ];
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  environment.systemPackages = with pkgs; [
    # utils
    git
    vim
    wget

    # c / c++
    gcc
    libgcc
    gnumake
    cmake

    waybar
    hyprpaper
    brave
    obsidian
    python3
    teams-for-linux
    zsh
    drawio
    libimobiledevice
    ifuse
  ];

  environment = {
    variables = {
      EDITOR = "nvim";
    };
  };

  programs.ssh.startAgent = true;
  programs.ssh.agentTimeout = "1h";

  system.stateVersion = "26.05";

}
