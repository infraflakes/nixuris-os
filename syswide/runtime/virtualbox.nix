{
  config,
  pkgs,
  lib,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  users.users.nixuris.extraGroups = [ "vboxusers" ];
  environment.systemPackages = with pkgs; [ virtualbox ];
  virtualisation.virtualbox = {
    host = {
      enable = true; # build & load vboxdrv etc.
      enableExtensionPack = true; # USB2/USB3, RDP, NVMe, PXE, etc.
    };
    guest = {
      enable = true;
      dragAndDrop = true; # needs GA ISO
    };
  };
}
