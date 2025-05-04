{ config, pkgs, ... }:
{
programs.neovim = {
  enable = true;
  viAlias = true;
  vimAlias = true;
};
xdg.configFile."nvim" = {
  source = ./resources/nvim;
  recursive = true;
};
}

