{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    wl-clipboard
    procps
  ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    cycle = true;
    terminal = "alacritty";
  };
  home.file.".config/rofi".source = ./config/rofi;
}
