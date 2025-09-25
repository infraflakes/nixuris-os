{
  config,
  pkgs,
  ...
}:
{
  imports = [
    # System core
    /etc/nixos/hardware-configuration.nix
    ./core/sys.nix
    ./core/graphics.nix
    ./core/misc.nix

    # User environment
    ./environment/user.nix
    ./environment/display-manager.nix
    ./environment/gnome.nix

    # Programs that needs privileges
    ./runtime/asus.nix
    ./runtime/mount.nix
    ./runtime/podman.nix
    ./runtime/gaming.nix
    ./runtime/virt.nix
  ];
}
