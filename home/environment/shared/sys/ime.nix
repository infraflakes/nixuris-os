{
  config,
  pkgs,
  ...
}: {
  i18n = {
    inputMethod.enable = true;
    inputMethod.type = "fcitx5";
    inputMethod.fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [qt6Packages.fcitx5-unikey];
    };
  };
}
