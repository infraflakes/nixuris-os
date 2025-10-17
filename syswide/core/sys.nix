{
  config,
  lib,
  pkgs,
  ...
}:
let
  grubTheme = builtins.toString ../../home/assets/hollow-grub;
in
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  #Bootloader
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      #kernelParams = [ "acpi_backlight=native" ];
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        #useOSProber = true;
        #theme = grubTheme;
      };
    };
    #blacklistedKernelModules = ["kvm" "kvm-intel" "bridge" "macvlan" "tap" "tun"];
  };
  #ZRAM Swap
  zramSwap.enable = true;
  swapDevices = [
    {
      device = "/swapfile";
      size = 24 * 1024;
      priority = 1;
    }
  ];
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
  };

  #Bluetooth
  hardware.bluetooth.enable = true;
  #Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
