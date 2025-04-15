{ pkgs, ... }:
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
    
    services.xserver = {
       enable = true;
       displayManager.gdm.enable = true;
    };
    
    #Network
    hardware.bluetooth.enable =true;
    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
	nameservers = [ "1.1.1.1" ];
    };


    #Time zone
    time.timeZone = "Asia/Ho_Chi_Minh";
    services.timesyncd.enable = true;

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
     			
    #PowerManagement
    powerManagement.powertop.enable = true;
    services.tlp = {
      enable = true;
      settings = {

      	DISK_IDLE_SECS_ON_AC=0;
      	DISK_IDLE_SECS_ON_BAT=60;

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
	
	CPU_BOOST_ON_AC=1;
	CPU_BOOST_ON_BAT=0;
	
	PLATFORM_PROFILE_ON_AC= "performance";
	PLATFORM_PROFILE_ON_BAT= "low-power";
	
	WIFI_PWR_ON_AC= "off";
	WIFI_PWR_ON_BAT= "on";
	
	PCIE_ASPM_ON_AC= "default";
	PCIE_ASPM_ON_BAT= "powersave";

	RUNTIME_PM_ON_AC= "on";
	RUNTIME_PM_ON_BAT= "auto";

	SOUND_POWER_SAVE_ON_AC=0;
	SOUND_POWER_SAVE_ON_BAT=10;

	USB_AUTOSUSPEND=1;

	CPU_SCALING_MIN_FREQ_ON_AC=400000;
	CPU_SCALING_MAX_FREQ_ON_AC=2300000;
	CPU_SCALING_MIN_FREQ_ON_BAT=400000;
	CPU_SCALING_MAX_FREQ_ON_BAT=100000;
      };
};

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
