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
    ./environment/profiles.nix

    # Programs that needs privileges
    ./runtime/asus.nix
    ./runtime/mount.nix
    #./runtime/gaming.nix
    ./runtime/virt-qemu.nix
    #./runtime/docker.nix
  ];
}
