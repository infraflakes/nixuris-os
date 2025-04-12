{ config, lib, pkgs, ... }:
{
    #Bootloader
    boot.loader = {
        #systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        #kernelParams = ["acpi_backlight=native"];
	grub = {
		enable = true;
		device = "nodev";
		useOSProber = true;
		efiSupport = true;
	};
    };
    #Display Manager
    services= {
       #displayManager.sddm.enable = true;
       xserver.enable = true; 
    };
    #Network
    hardware.bluetooth.enable =true;
    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
    };


    #Time zone
    time.timeZone = "Asia/Ho_Chi_Minh";


    #Virtualization
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;  # enable copy and paste between host and guest
    virtualisation.spiceUSBRedirection.enable = true; 
    #virtualisation.waydroid.enable = true;
    #Tablet
    hardware.opentabletdriver.enable = true;
    #GPU
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [libglvnd libvdpau-va-gl];
};
	#Environment Variables
	environment.variables = {
		VDPAU_DRIVER = "va_gl";
    		LIBVA_DRIVER_NAME = "intel";
	}; 
    services.xserver.videoDrivers = [ "modesetting" ]; 
    hardware = {
        nvidia = { 
            open = false;
            powerManagement.enable = false;
            package = config.boot.kernelPackages.nvidiaPackages.stable; 
  			powerManagement.finegrained = false;	
     		modesetting.enable = true;# nvidia-drm.modeset=1 is required for some wayland compositors, e.g. sway 
            prime = { 
      			offload = {
					enable = true;
                    enableOffloadCmd = true;
				};
					nvidiaBusId = "PCI:1:0:0";# Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA 
      				intelBusId = "PCI:0:2:0"; 
     			};
  			};
		};
    #PowerManagement
    powerManagement.powertop.enable = true; 
    #Input
    
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.inputMethod = {
    enable = true;
    fcitx5.waylandFrontend = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-unikey ];
  };
    i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };

    # Configure keymap in X11
    services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


    #Shell
    programs.fish.enable = true;    


    #Sound 
    security.rtkit.enable = true;
    services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
};

    #Asus Linux
    services.supergfxd.enable = true;
    systemd.services.supergfxd.path = [ pkgs.pciutils ];
    services.blueman.enable = true;
    services = {
        asusd = {
            enable = true;
            enableUserService = true;
    };
};

    #Services
    services.gvfs.enable = true; # Mount, trash, and other functionalities
}
