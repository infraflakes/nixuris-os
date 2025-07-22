{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hypr.nix
    ./gtk-qt.nix
    ./fish.nix
    ./rofi.nix
    ./waybar.nix
    ./swaylock.nix
    ./swappy.nix
    ./swaync.nix
  ];
}
