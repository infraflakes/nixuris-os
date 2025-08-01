{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Niri specifics
    ./niri/niri.nix
    ./niri/mako.nix
    # Shared between WMs
    ./shared/gtk.nix
    ./shared/rofi.nix
    ./shared/waybar.nix
    ./shared/swaylock.nix
    # Hyprland specifics
    #./hypr/hypr.nix
    #./hypr/swappy.nix
    #./hypr/swaync.nix
  ];
}
