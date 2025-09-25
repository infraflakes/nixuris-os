{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [ ];
  programs.waybar = {
    enable = true;
  };
  home.file.".config/waybar".source = ./config/waybar;
}
