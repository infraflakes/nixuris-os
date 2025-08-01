{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    rmpc
    mpc
    mpv
    ani-cli
    kew
    easytag
    nicotine-plus
    imv
  ];
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";
  };
  home.file.".config/mpd".source = ../confs/config/mpd;
  home.file.".config/rmpc".source = ../confs/config/rmpc;
}
