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
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-gstreamer
    ];
  };
}
