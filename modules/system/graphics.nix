{ config, lib, pkgs, ... }:
{
    #GPU
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [libglvnd libvdpau-va-gl];
    };
    environment.variables = {
		  VDPAU_DRIVER = "va_gl";
    	LIBVA_DRIVER_NAME = "intel";
	  };
    services.xserver.videoDrivers = [ "nvidia" ]; 
    hardware.nvidia = {
    modesetting.enable = true; #required!!
    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking up from sleep.
    powerManagement.enable = false;
    # Fine-grained power management. Turns off GPU when not in use, only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;
    # Use the NVidia open source kernel module (not to be confused with the independent third-party "nouveau" open source driver).
    open = true;
    # Enable the Nvidia settings menu, accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
    		offload = {
			enable = true;
			enableOffloadCmd = true;
		};
		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:1:0:0";
	};
  };
}
