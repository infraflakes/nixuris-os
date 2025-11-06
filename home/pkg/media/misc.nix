{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    onlyoffice-desktopeditors
    zoom-us
    planify
  ];
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-backgroundremoval
      obs-gstreamer
    ];
  };
}
