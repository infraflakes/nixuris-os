{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [fzf ripgrep];
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim".source = ./config/nvim;
}
