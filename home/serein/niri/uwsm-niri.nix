{ config, pkgs, ... }:

{
  home.file.".config/uwsm/env-niri" = {
    text = ''
      # Xwayland
      export DISPLAY=:0
    '';
  };
}
