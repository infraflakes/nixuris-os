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
}
