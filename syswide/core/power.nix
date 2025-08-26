{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [powertop];
  services.logind = {
    lidSwitch = "ignore";
    lidSwitchExternalPower = "ignore";
  };
  powerManagement.powertop.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      DISK_IDLE_SECS_ON_AC = 240;
      DISK_IDLE_SECS_ON_BAT = 240;

      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "power";

      PLATFORM_PROFILE_ON_AC = "balanced";
      PLATFORM_PROFILE_ON_BAT = "balanced";

      WIFI_PWR_ON_AC = "on";
      WIFI_PWR_ON_BAT = "on";

      PCIE_ASPM_ON_AC = "powersupersave";
      PCIE_ASPM_ON_BAT = "powersupersave";

      RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "auto";

      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;

      USB_AUTOSUSPEND = 1;
    };
  };
}
