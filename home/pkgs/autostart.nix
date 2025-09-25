{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    mpd
    mpd-mpris
    music-discord-rpc
  ];

  xdg.configFile = {
    "autostart/mpd.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=MPD
      Exec=mpd ${config.xdg.configHome}/mpd/mpd.conf
    '';
    "autostart/mpd-mpris.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Mpris for MPD
      Exec=bash -c "until ${pkgs.mpc}/bin/mpc > /dev/null 2>&1; do sleep 1; done; exec mpd-mpris"
    '';
    "autostart/mpris-discord-rpc.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Mpris Discord
      Exec=music-discord-rpc
    '';
  };
}
