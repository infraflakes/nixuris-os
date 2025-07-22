{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    mpv
    ani-cli
    kew
    easytag
    nicotine-plus
    imv
  ];
}
