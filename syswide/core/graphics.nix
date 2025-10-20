{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.xserver.videoDrivers = [
    "nvidia"
    "modesetting"
  ];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libglvnd
        intel-media-driver # For Intel VA-API
        libvdpau-va-gl # VDPAU-to-VA-API translation for Intel
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      powerManagement.enable = true;
      powerManagement.finegrained = true;
      open = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
