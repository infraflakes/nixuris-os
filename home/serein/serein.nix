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
    ./shared/hide-desktop-entry.nix
    ./shared/autostart.nix
    ./shared/env.nix
    ./shared/mako.nix
    ./shared/rofi.nix
    ./shared/waybar.nix
    ./shared/swaylock.nix
    ./shared/wallpapers.nix

    # Hyprland specifics
    ./hypr/hypr.nix
    ./hypr/swappy.nix
    ./hypr/uwsm.nix
  ];
}
