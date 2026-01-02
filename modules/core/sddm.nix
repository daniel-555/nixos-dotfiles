{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    extraPackages = [ pkgs.sddm-astronaut ];
    theme = "sddm-astronaut-theme";
    wayland.enable = true;
  };

  environment.systemPackages = [ pkgs.sddm-astronaut ];
}
