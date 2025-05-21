{
  config,
  pkgs,
  lib,
  ...
}: let
  agsConfigPath = builtins.toString ./ags;
in {
  home.packages = with pkgs; [
    ags
    astal.io
    astal.gjs
    astal.hyprland
    gjs
    gobject-introspection
    gtk-layer-shell
    gnome-bluetooth
    gtksourceview
    webkitgtk
    accountsservice
  ];

  xdg.configFile."ags" = {
    source = config.lib.file.mkOutOfStoreSymlink agsConfigPath;
    #source = ./ags;
    recursive = true;
  };
}
