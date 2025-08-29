{
  config,
  pkgs,
  ...
}: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./core/sys.nix
    ./core/graphics.nix
    ./core/power.nix
    ./core/user.nix

    ./runtime/display-manager.nix
    ./runtime/asus.nix
    ./runtime/mount.nix
    ./runtime/podman.nix
    #./runtime/gnome.nix
    #./runtime/kde.nix
    ./runtime/gaming.nix
    #./runtime/virt.nix
  ];
}
