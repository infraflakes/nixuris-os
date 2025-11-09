{
  config,
  pkgs,
  lib,
  ...
}: {
  home = {
    packages = with pkgs; [
      fzf
      ripgrep
      gcc
      gnumake
      stylua
      alejandra
    ];
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim".source = ./config/nvim;
}
