{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./core/hardware-configuration.nix
    ./core/sys.nix
    ./core/graphics.nix
    ./core/power.nix
    ./core/user.nix

    ./runtime/display-manager.nix
    ./runtime/asus.nix
    ./runtime/mount.nix
    ./runtime/gaming.nix
  ];
}
