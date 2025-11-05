{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  xdg.dataFile."wayland-sessions/mango.desktop" = {
    text = ''
      [Desktop Entry]
      Name=mango (UWSM)
      Comment=Stacking-tiling Wayland compositor
      Exec=/home/infraflakes/.nix-profile/bin/mango
      Type=Application
      DesktopNames=mango
    '';
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
  home = {
    packages = with pkgs; [
      xwayland
    ];
  };
  wayland.windowManager.mango = {
    enable = true;
    settings = ''
      bind=SUPER,m,quit
      bind=SUPER,Return,spawn,kitty
      bind=SUPER,Space,spawn,rofi -show drun
      bind=SUPER,q,killclient,
      bind=SUPER,r,reload_config
    '';
    autostart_sh = ''
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    '';
  };
}
