{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [imagemagick];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    cycle = true;
    terminal = "alacritty";
  };
  home.file.".config/rofi".source = ./config/rofi;
}
