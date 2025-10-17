{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.mako = {
    enable = true;

    extraConfig = ''
      layer=overlay
      background-color=#1b1e25
      border-size=3
      border-color=#86afef
      default-timeout=5000
      ignore-timeout=1
      font=JetBrains Mono Nerd Font 13
      text-color=#86afef
      outer-margin=0,5,15,0
      anchor=top-center
      border-radius=8
      progress-color=over #343945

      icons=1
      max-icon-size=64
      icon-path=/usr/share/icons/:/usr/share/pixmaps
      icon-location=left
      icon-border-radius=4

      max-history=100
      history=1

      [urgency=high]
      border-color=#86afef
      default-timeout=0

      [urgency=low]
      border-color=#86afef

      [category=mpd]
      default-timeout=2000
      group-by=category

      [app-name="Steam"]
      invisible=1
    '';
  };
}
