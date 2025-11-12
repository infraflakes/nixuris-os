{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    procps
    imagemagick
  ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    cycle = true;
    terminal = "kitty";
  };
  home.file.".config/rofi".source = ./config/rofi;
}
