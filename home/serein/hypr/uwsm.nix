{ config, pkgs, ... }:

{
  home.file.".config/uwsm/env-hyprland" = {
    text = ''
      # Theming
      export HYPRCURSOR_THEME=Bibata-Modern-Ice
      export HYPRCURSOR_SIZE=24
      export XCURSOR_THEME=Bibata-Modern-Ice
      export XCURSOR_SIZE=24

      # Aquamarine multi-GPU configuration
      export AQ_DRM_DEVICES=/dev/dri/card2:/dev/dri/card1

      # Nvidia
      # export LIBVA_DRIVER_NAME=nvidia
      # export GBM_BACKEND=nvidia-drm
      # export __GLX_VENDOR_LIBRARY_NAME=nvidia
      # export NVD_BACKEND=direct
    '';
  };
}
