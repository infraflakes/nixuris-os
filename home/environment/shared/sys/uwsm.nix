{
  config,
  pkgs,
  ...
}: {
  home.file.".config/uwsm/env" = {
    text = ''
      # Cursor theming
      export XCURSOR_THEME=Bibata-Modern-Ice
      export XCURSOR_SIZE=24

      export QT_SCALE_FACTOR=1
      export QT_AUTO_SCREEN_SCALE_FACTOR=1
      export QT_QPA_PLATFORM=wayland;xcb
      export QT_QPA_PLATFORMTHEME=gtk3
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export MOZ_ENABLE_WAYLAND=1
      export EGL_PLATFORM=wayland

      # Nvidia
      # export LIBVA_DRIVER_NAME=nvidia
      # export GBM_BACKEND=nvidia-drm
      # export __GLX_VENDOR_LIBRARY_NAME=nvidia
      # export NVD_BACKEND=direct
    '';
  };
}
