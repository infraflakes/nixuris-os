{
  config,
  lib,
  pkgs,
  ...
}: {
  services.dunst = {
    enable = true;

    # Optional: Use a custom package
    # package = pkgs.dunst;

    # Optional: Path to a custom config
    # configFile = ./dunstrc;

    # Configure using built-in options
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        geometry = "300x5-10+40";
        transparency = 10;
        padding = 8;
        horizontal_padding = 8;
        frame_width = 3;
        frame_color = "#89b4fa";
        separator_color = "frame";
        font = "JetBrainsMono Nerd Font 10";
        line_height = 4;
        icon_position = "left";
        max_icon_size = 64;
        icon_path = ["${pkgs.gnome.adwaita-icon-theme}/share/icons/Adwaita"];
      };

      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout = 5;
      };

      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#f9e2af";
        timeout = 10;
      };

      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#f38ba8";
        frame_color = "#f38ba8";
        timeout = 0;
      };
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
      size = 48;
    };

    # If using Wayland with a non-default display:
    # waylandDisplay = "wayland-1";
  };
}
