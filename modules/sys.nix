{ config, lib, pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;
    #Bootloader
    boot = {
    	loader = {
        efi.canTouchEfiVariables = true;
        #kernelParams = ["acpi_backlight=native"];
		  grub = {
			  enable = true;
			  device = "nodev";
			  useOSProber = true;
			  efiSupport = true;
		  };
    };
	    blacklistedKernelModules = [ "kvm" "kvm-intel" "bridge" "macvlan" "tap" "tun"];
  };
    #Time zone
    time.timeZone = "Asia/Ho_Chi_Minh";
    services.timesyncd.enable = true; 
    
    #Network
    networking = {
      hostName = "nixos";
      networkmanager.enable = true;
	    nameservers = [ "1.1.1.1" ];
    };
    
    #Bluetooth
    #hardware.bluetooth.enable =true;
    
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
	    noto-fonts
	    noto-fonts-cjk-sans
	    noto-fonts-emoji
	    nerd-fonts.jetbrains-mono
	    fira-code
	    fira-code-symbols
	    font-awesome
      jetbrains-mono
    ];
    
    #Disabled systemd services  
    systemd = {
      services = {
        avahi-daemon.enable = false;
        NetworkManager-wait-online.enable = false;
        NetworkManager-dispatcher.enable = false;
        firewall.enable = false;
        accounts-daemon.enable = false;
    };
  };

    #Asus Linux
    services.supergfxd.enable = false;
    #systemd.services.supergfxd.path = [ pkgs.pciutils ];
    services = {
        asusd = {
          enable = true;
          enableUserService = true;
      };
  };
      security.pam.services.swaylock = {};

    #Mounting
    services.usbmuxd = {
      enable = true;
      package = pkgs.usbmuxd2;
  };
    programs.adb.enable = true;
    services.gvfs.enable = true; # Mount, trash, and other functionalities
    
    #Sys pkgs 
    environment.systemPackages = with pkgs; [
      git
      glib
      pciutils
      powertop
      tree
      wget
      htop
      atool
      zip
      unzip
      p7zip
      usbutils
      nautilus sushi
      libimobiledevice ifuse
  ];
  
}
