{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ foot ];
  xdg.configFile."foot/foot.ini".text = ''
    font=JetBrainsMono Nerd Font:size=13
    pad=15x15

    [colors]
    foreground=eeedee
    background=040d0c
    selection-foreground=000000
    selection-background=b4d5ff

    regular0=4f4f4f
    regular1=fa6c5f
    regular2=a8fe60
    regular3=729ebb
    regular4=6b82ba
    regular5=6383cf
    regular6=6383aa
    regular7=eeedee

    bright0=7b7b7b
    bright1=fcb6af
    bright2=ceffab
    bright3=fffecc
    bright4=b5dcfe
    bright5=fb9bfe
    bright6=dfdffd
    bright7=fefffe

    cursor=000000 7f7f7f

    [cursor]
    style=beam
    blink=no

    [tweak]
    font-monospace-warn=no

    [main]
    shell=/run/current-system/sw/bin/fish

  '';
}
