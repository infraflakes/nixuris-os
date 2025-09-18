{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."autostart/mpd.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=once
    Exec=mpd ~/.config/mpd/mpd.conf
  '';
  xdg.configFile."autostart/mpd-mpris.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=once
    Exec=mpd-mpris
  '';
  xdg.configFile."autostart/mpris-discord-rpc.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=once
    Exec=mpris-discord-rpc
  '';
}
