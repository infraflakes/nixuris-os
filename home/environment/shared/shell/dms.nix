{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];
  programs.dankMaterialShell = {
    enable = true;
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableClipboard = true; # Clipboard history manager
    enableBrightnessControl = true; # Backlight/brightness controls
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
    default.settings.theme = "dark";
    systemd.enable = true; # Systemd service for auto-start
    niri = {
      enableSpawn = true; # Auto-start DMS with niri
    };
  };
}
