{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [mpd-mpris cava playerctl];
  programs.waybar = {
    enable = true;
  };
  home.file.".config/waybar".source = ./config/waybar;
}
