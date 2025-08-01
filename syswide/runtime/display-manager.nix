{
  config,
  pkgs,
  lib,
  ...
}: {
  services.displayManager.gdm.enable = true;

  services.displayManager.sddm = {
    enable = false;
    wayland.enable = true;
  };

  programs.hyprland.enable = true;
  programs.niri.enable = true;
}
