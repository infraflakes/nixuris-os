{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    cycle = true;
    terminal = "alacritty";
  };
  home.file.".config/rofi".source = ./config/rofi;
}
