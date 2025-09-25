{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    swww
    imagemagick
  ];
  home.file.".config/wallpapers".source = ./config/wallpapers;
}
