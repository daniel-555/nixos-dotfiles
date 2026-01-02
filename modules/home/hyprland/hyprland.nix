{ pkgs, ... }: {
  home.packages = with pkgs; [ wl-clipboard hyprpicker ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;

    settings = {
      general = {
        "$mod" = "ALT";
        "$terminal" = "kitty";
        "$browser" = "brave";
        layout = "dwindle";
        gaps_in = 6;
        gaps_out = 8;
        border_size = 2;
        resize_on_border = true;
      };

      cursor = { no_hardware_cursors = 0; };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          ignore_opacity = false;
          new_optimizations = true;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
      };

      xwayland = { force_zero_scaling = true; };

      input = {
        kb_layout = "us";
        kb_options = [ "caps:escape" ];
        numlock_by_default = true;
        repeat_delay = 300;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          scroll_factor = 0.8;
        };
      };

      monitor = [ "eDP-1, preferred, 0x0, 1" ", preferred, auto, auto" ];
    };
  };
}
