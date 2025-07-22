{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./fonts.nix
    ./media.nix
    ./social.nix
    ./misc.nix
  ];
}
