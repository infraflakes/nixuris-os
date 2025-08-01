{
  config,
  pkgs,
  ...
}: let
  scriptsDir = builtins.toString ./scripts;
in {
  home.packages = with pkgs; [mpd-mpris cava];
  programs.waybar = {
    enable = true;
  };
  home.file.".config/waybar".source = ./config/waybar;
}
