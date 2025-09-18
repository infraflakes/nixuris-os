{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.etc."xdg/wayland-sessions/gnome.desktop".text = ''
    [Desktop Entry]
    Name=Gnome On Wayland
    Exec=/run/current-system/sw/bin/gnome-session -- session=gnome-wayland
    TryExec=/run/current-system/sw/bin/gnome-session
    Type=Application
    DesktopNames=GNOME
  '';
  services.desktopManager.gnome.enable = true;
  services.power-profiles-daemon.enable = false;
  services.udev.packages = [pkgs.gnome-settings-daemon];
  services.gnome.rygel.enable = false;
  services.gvfs.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    file-roller
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
