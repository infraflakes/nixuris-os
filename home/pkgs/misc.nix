{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    onlyoffice-desktopeditors
    zoom-us
    obs-studio
    obs-studio-plugins.wlrobs
  ];
}
