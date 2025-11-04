{ config, pkgs, ... }:

{
  home.file.".config/uwsm/env" = {
    text = ''
      # Theming
      export XCURSOR_THEME=Bibata-Modern-Ice
      export XCURSOR_SIZE=24

      # Nvidia
      # export LIBVA_DRIVER_NAME=nvidia
      # export GBM_BACKEND=nvidia-drm
      # export __GLX_VENDOR_LIBRARY_NAME=nvidia
      # export NVD_BACKEND=direct
    '';
  };
}
