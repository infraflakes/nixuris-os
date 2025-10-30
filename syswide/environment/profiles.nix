{
  config,
  pkgs,
  lib,
  ...
}:
{
  security.polkit.enable = true;
  programs.niri.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
}
