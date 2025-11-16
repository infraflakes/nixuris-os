{
  config,
  pkgs,
  ...
}: let
  mangowc = ./mangowc;
  niri = ./niri;
  hypr = ./hypr;
in {
  imports = [
    (niri + "/niri.nix")
    (niri + "/uwsm-niri.nix")
  ];
}
