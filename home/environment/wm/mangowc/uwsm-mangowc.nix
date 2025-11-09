{
  config,
  pkgs,
  ...
}: {
  home.file.".config/uwsm/env-mango" = {
    text = ''
      #export WLR_DRM_DEVICES=/dev/dri/card1:/dev/dri/card0
      export WLR_DRM_DEVICES=/dev/dri/card1 # force compositor to use igpu only
    '';
  };
}
