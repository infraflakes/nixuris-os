{
  config,
  pkgs,
  ...
}: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./core/sys.nix
    ./core/power.nix
    ./core/user.nix
    ./core/tools.nix

    ./runtime/podman.nix
  ];
}
