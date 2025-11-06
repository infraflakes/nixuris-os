{
  config,
  pkgs,
  ...
}:

{
  home.file.".config/uwsm/env" = {
    text = ''
      # Cursor theming
      export XCURSOR_THEME=Bibata-Modern-Ice
      export XCURSOR_SIZE=24

      export NIXOS_OZONE_WL=1
      export CLUTTER_BACKEND=wayland
      export GDK_BACKEND=wayland,x11
      export QT_AUTO_SCREEN_SCALE_FACTOR=1
      export QT_QPA_PLATFORM=wayland;xcb
      export QT_QPA_PLATFORMTHEME=qt6ct
      export QT_SCALE_FACTOR=1
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
