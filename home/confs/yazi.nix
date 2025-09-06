{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [yazi zip unzip p7zip unrar];
  services = {
    udiskie.enable = true;
    udiskie.tray = "auto";
  };
}
