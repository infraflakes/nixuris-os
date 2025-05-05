{ config, lib, pkgs, ... }:
{
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
}
