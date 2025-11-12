{
  config,
  pkgs,
  ...
}: {
  home.file.".config/wallpapers".source = ./config/wallpapers;
}
