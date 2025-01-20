vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
vim.diagnostic.config({
  virtual_text = true, -- Show inline error messages
  signs = true,        -- Show signs in the gutter
  underline = true,    -- Underline issues
  update_in_insert = false, -- Update diagnostics while typing
})
vim.cmd [[
  highlight DiagnosticError guifg=#FF0000
  highlight DiagnosticWarn guifg=#FFA500
  highlight DiagnosticInfo guifg=#00FFFF
  highlight DiagnosticHint guifg=#00FF00
]]
vim.schedule(function()
  require "mappings"
end)
