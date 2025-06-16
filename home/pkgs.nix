{
  config,
  pkgs,
  inputs,
  zen-browser,
  ...
}: {
  home.packages = with pkgs; [
    dconf
    telegram-desktop
    vesktop
    mpv
    ani-cli
    kew
    easytag
    nicotine-plus
    imv
    onlyoffice-desktopeditors
    zoom-us
    obs-studio
    obs-studio-plugins.wlrobs
    inputs.zen-browser.packages.x86_64-linux.twilight-official
  ];
}
