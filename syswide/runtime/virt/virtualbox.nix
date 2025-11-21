{
  config,
  pkgs,
  lib,
  username,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  users.extraGroups.vboxusers.members = ["${username}"];
  environment.systemPackages = with pkgs; [virtualbox];
  virtualisation.virtualbox = {
    host = {
      enable = true; # build & load vboxdrv etc.
    };
    guest = {
      enable = true;
      dragAndDrop = true; # needs GA ISO
    };
  };
}
