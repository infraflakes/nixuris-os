{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  wayland.windowManager.mango = {
    enable = true;
    settings = ''
      bind=SUPER,m,quit
      bind=SUPER,Return,spawn,${pkgs.kitty}/bin/foot
      bind=SUPER,Space,spawn,${pkgs.rofi}/bin/rofi -show drun
      bind=SUPER,q,killclient,
      bind=SUPER,r,reload
    '';
  };
}
