{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      mango = {
        prettyName = "MangoWC";
        comment = "Mango compositor managed by UWSM";
        binPath = "/home/infraflakes/.nix-profile/bin/mango";
      };
      # niri = {
      #   prettyName = "Niri";
      #   comment = "Niri compositor managed by UWSM";
      #   binPath = "${pkgs.niri}/bin/niri-session";
      # };
    };
  };
}
