{
  config,
  lib,
  pkgs,
  ...
}: let
  grubTheme = builtins.toString ../../home/assets/hollow-grub;
in {
  nix.settings.experimental-features = ["nix-command" "flakes"];
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
        #useOSProber = true;
        efiSupport = true;
	#theme = grubTheme;
      };
    };
    #blacklistedKernelModules = ["kvm" "kvm-intel" "bridge" "macvlan" "tap" "tun"];
  };
  #boot.kernelPackages = pkgs.linuxPackages_latest;

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
  #Time zone
  time.timeZone = "Asia/Ho_Chi_Minh";
  services.timesyncd.enable = true;

  #Network
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1"];
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
  #Fonts
  fonts.packages = with pkgs; [
  ];

  #Disabled systemd services
  systemd = {
    services = {
      #avahi-daemon.enable = false;
      NetworkManager-wait-online.enable = false;
      NetworkManager-dispatcher.enable = false;
      firewall.enable = false;
      #accounts-daemon.enable = false;
    };
  };

  security.pam.services.swaylock = {};

  #Sys pkgs
  environment.systemPackages = with pkgs; [
    htop
    home-manager
    gcc
  ];
  services.flatpak.enable = true;
}
