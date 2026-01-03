{ pkgs, ... }: {
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
    image = ../../wallpapers/retrowave-sunset.jpg;
  };
}
