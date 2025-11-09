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
    # (mangowc + "/mangowc.nix")
    # (mangowc + "/swappy.nix")
    # (mangowc + "/uwsm-mangowc.nix")

    (niri + "/niri.nix")
    (niri + "/uwsm-niri.nix")
  ];
}
