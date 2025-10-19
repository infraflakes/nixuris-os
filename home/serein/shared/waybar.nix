{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    playerctl
  ];
  programs.waybar = {
    enable = true;
  };
  home.file.".config/waybar".source = ./config/waybar;
  home.file.".local/bin/album-art.sh" = {
    source = ./config/waybar/scripts/album-art.sh;
    executable = true;
  };
}
