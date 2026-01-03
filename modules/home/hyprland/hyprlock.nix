{ config, ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = { hide_cursor = true; };
      background = [{
        path = config.stylix.image;
        blur_passes = 3;
        blur_size = 8;
      }];
      input-field = [{
        size = "300, 75";
        monitor = "";
        dots_center = true;
        fade_on_empty = true;
        font_color = "rgb(${config.lib.stylix.colors.base00})";
        inner_color = "rgb(${config.lib.stylix.colors.base09})";
        outer_color = "rgb(${config.lib.stylix.colors.base01})";
        outline_thickness = 5;
        shadow_passes = 2;
      }];
    };
  };
}

