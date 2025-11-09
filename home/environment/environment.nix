{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./wm/wm.nix
    ./shared/shared.nix
  ];
}
