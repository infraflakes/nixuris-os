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
    #./niri/mako.nix
    # Shared between WMs
    ./shared/mako.nix
    ./shared/rofi.nix
    ./shared/waybar.nix
    ./shared/swaylock.nix
    ./shared/wallpapers.nix
    # Hyprland specifics
    ./hypr/hypr.nix
    ./hypr/swappy.nix
    ./hypr/swaync.nix
  ];
}
