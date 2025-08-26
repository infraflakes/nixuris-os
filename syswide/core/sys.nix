{
  config,
  lib,
  pkgs,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  #Bootloader
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
    };
  };
  #ZRAM Swap
  zramSwap.enable = true;
  swapDevices = [
    {
      device = "/swapfile";
      size = 8 * 1024;
      priority = 1;
    }
  ];
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
  };
}
