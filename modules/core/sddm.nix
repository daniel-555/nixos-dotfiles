{ pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    extraPackages = [ pkgs.sddm-astronaut ];
    theme = "sddm-astronaut-theme";
    wayland.enable = true;
    # settings.X11 = {
    #   XkbLayout = "us";
    #   XkbOptions = "caps:escape";
    # };
  };

  environment.systemPackages = [ pkgs.sddm-astronaut ];
}
