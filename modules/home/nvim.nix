{
  config,
  pkgs,
  lib,
  ...
}: let
  nvimConfigPath = builtins.toString ../../resources/nvim;
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink nvimConfigPath;
    recursive = true;
  };
}
