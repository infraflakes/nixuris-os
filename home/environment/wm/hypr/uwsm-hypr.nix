{
  config,
  pkgs,
  ...
}: {
  home.file.".config/uwsm/env-hyprland" = {
    text = ''
      # Aquamarine multi-GPU configuration
      export AQ_DRM_DEVICES=/dev/dri/card2:/dev/dri/card1
    '';
  };
}
