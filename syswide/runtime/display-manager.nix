{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.hyprland.enable = true;
  
  services.displayManager.gdm.enable = true;
  
  services.displayManager.sddm = {
    enable = false;
    wayland.enable = true;
  };

}
