{ config, lib, pkgs, ... }:
{
  services.power-profiles-daemon.enable = false;
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
  plasma-browser-integration
  konsole
  elisa
  gwenview
  okular
  kate
  khelpcenter
  dolphin
  baloo-widgets # baloo information in Dolphin
  dolphin-plugins
  ffmpegthumbs
  krdp
];

}
