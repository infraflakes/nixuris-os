{ config, pkgs, ... }:

let
  lazyVimPlugins = with pkgs.vimPlugins; [
    lazy-nvim
    LazyVim
    nvim-treesitter
    telescope-nvim
    lualine-nvim
  ];

  lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map (plugin: {
    name = plugin.pname;
    path = plugin;
  }) lazyVimPlugins);

  neovimWithLua = pkgs.neovim.override {
    lua = pkgs.lua;      # supply a Lua interpreter
  };
in
{
 
programs.neovim = {
  enable  = true;
  package = pkgs.neovim-unwrapped;
  extraPackages = [
    pkgs.lua pkgs.ripgrep pkgs.fd
    pkgs.lua-language-server
  ];
  plugins = with pkgs.vimPlugins; [
    lazy-nvim
    LazyVim
    nvim-treesitter
    telescope-nvim
    lualine-nvim
  ];
  extraLuaConfig = ''
  vim.g.loaded_snacks = 1
    require("lazy").setup({
      defaults = { lazy = true },
      spec = {
        { import = "lazyvim.plugins" },
        { import = "plugins.custom" },
      }
    })
  '';
};

}

