{
  config,
  lib,
  pkgs,
  ...
}: {
  services.desktopManager.gnome.enable = true;
  services.power-profiles-daemon.enable = false;
  services.udev.packages = [pkgs.gnome-settings-daemon];
  services.gnome.rygel.enable = false;

  environment.gnome.excludePackages = with pkgs; [
    loupe
    file-roller
    gnome-system-monitor
    rygel
    orca
    evince
    geary
    gnome-disk-utility
    seahorse
    sysprof
    gnome-color-manager
    adwaita-icon-theme
    gnome-backgrounds
    gnome-tour
    gnome-user-docs
    baobab
    epiphany
    gnome-text-editor
    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-console
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-weather
    gnome-connections
    simple-scan
    totem
    yelp
    gnome-software
  ];
  environment.systemPackages = with pkgs; [
    gnome-session
    mutter
    gnome-tweaks
    gnome-extension-manager
    dconf-editor
    gnomeExtensions.blur-my-shell
    gnomeExtensions.user-themes
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-dock
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.emoji-copy
    gnomeExtensions.mpris-label
    gnomeExtensions.appindicator
    gnomeExtensions.app-menu-is-back
    gnomeExtensions.kimpanel
    gnomeExtensions.just-perfection
  ];
}
