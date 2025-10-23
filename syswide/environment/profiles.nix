{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
}
