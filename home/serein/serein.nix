{
  config,
  pkgs,
  ...
}:
{
  imports = [

    # Niri specifics
    #./niri/niri.nix
    #./niri/xwayland.nix

    # Shared between environments
    ./shared/modify-desktop-entry.nix
    ./shared/autostart.nix
    ./shared/env.nix
    ./shared/mako.nix
    ./shared/rofi.nix
    ./shared/waybar.nix
    ./shared/swaylock.nix
    ./shared/wallpapers.nix
    ./shared/uwsm.nix

    # Mangowc specifics
    ./mangowc/mangowc.nix
    ./mangowc/swappy.nix
    ./mangowc/uwsm-mangowc.nix

    # Hyprland specifics
    # ./hypr/hypr.nix
    # ./hypr/swappy.nix
    # ./hypr/uwsm-hypr.nix

    # Niri specifics
    # ./niri/niri.nix
    # ./niri/xwayland.nix
    # ./niri/uwsm-niri.nix
  ];
}
