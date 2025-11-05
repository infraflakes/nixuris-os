{ config, pkgs, ... }:

{
  home.file.".config/uwsm/env" = {
    text = ''
      #export WLR_DRM_DEVICES=/dev/dri/card1:/dev/dri/card0 mango
      export WLR_DRM_DEVICES=/dev/dri/card1 mango

      # Fix OBS simple mode fail
      export LIBVA_DRIVER_NAME=intel

      # Nvidia
      # export LIBVA_DRIVER_NAME=nvidia
      # export GBM_BACKEND=nvidia-drm
      # export __GLX_VENDOR_LIBRARY_NAME=nvidia
      # export NVD_BACKEND=direct
    '';
  };
}
