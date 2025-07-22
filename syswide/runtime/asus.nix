{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [pciutils];
  services.supergfxd.enable = true;
  systemd.services.supergfxd.path = [pkgs.pciutils];
  services = {
    asusd = {
      enable = true;
      enableUserService = true;
    };
  };
}
