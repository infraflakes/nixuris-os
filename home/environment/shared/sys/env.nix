{
  config,
  pkgs,
  ...
}:
{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    MOZ_ENABLE_WAYLAND = 1;
    MOZ_DISABLE_RDD_SANDBOX = 1;
    EGL_PLATFORM = "wayland";
  };
}
