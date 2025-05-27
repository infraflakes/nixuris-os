{
  config,
  lib,
  pkgs,
  ...
}: {
  #PowerManagement
  powerManagement.powertop.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      DISK_IDLE_SECS_ON_AC = 30;
      DISK_IDLE_SECS_ON_BAT = 30;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      #CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;

      PLATFORM_PROFILE_ON_AC = "performance";
      #PLATFORM_PROFILE_ON_AC = "balanced";
      PLATFORM_PROFILE_ON_BAT = "balanced";

      WIFI_PWR_ON_AC = "off";
      WIFI_PWR_ON_BAT = "on";

      PCIE_ASPM_ON_AC = "powersupersave";
      PCIE_ASPM_ON_BAT = "powersupersave";

      RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "auto";

      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 10;

      START_CHARGE_THRESH_BAT0 = 85;
      STOP_CHARGE_THRESH_BAT0 = 90;

      USB_AUTOSUSPEND = 1;

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 70;
      #CPU_SCALING_MIN_FREQ_ON_AC=400000;
      #CPU_SCALING_MAX_FREQ_ON_AC=4600000;
      #CPU_SCALING_MIN_FREQ_ON_BAT=400000;
      #CPU_SCALING_MAX_FREQ_ON_BAT=100000;
    };
  };
}
