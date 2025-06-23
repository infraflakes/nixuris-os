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
    rygel
    orca
    evince
    geary
    gnome-disk-utility
    seahorse
    sysprof
    #
    gnome-color-manager
    adwaita-icon-theme
    # nixos-background-info
    gnome-backgrounds
    # gnome-bluetooth
    # gnome-color-manager
    # gnome-control-center
    # gnome-shell-extensions
    gnome-tour # GNOME Shell detects the .desktop file on first log-in.
    gnome-user-docs
    # gtk3.out # for gtk-launch program
    # xdg-user-dirs # Update user dirs as described in https://freedesktop.org/wiki/Software/xdg-user-dirs/
    # xdg-user-dirs-gtk # Used to create the default bookmarks
    #
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
    # gnome-system-monitor
    gnome-weather
    # loupe
    gnome-connections
    simple-scan
    #snapshot
    totem
    yelp
    gnome-software
  ];
  environment.systemPackages = with pkgs; [
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
    # ...
  ];
}
