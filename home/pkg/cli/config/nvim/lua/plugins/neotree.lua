return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
  },
  config = function()
    require("neo-tree").setup {
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
          enabled = true,
        },
        window = {
          mappings = {
            ["<cr>"] = "open_with_window_picker", -- Use enter to trigger window picker
          },
        },
        hijack_netrw_behavior = "open_default",
      },
      buffers = {
        window = {
          mappings = {
            ["<cr>"] = "open_with_window_picker",
          },
        },
      },
      window_picker = {
        enabled = true,
        picker = "fzf", -- also accepts "fzf" if you got telescope or fzf
        exclude = {
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          buftype = { "terminal", "quickfix", "nofile" },
        },
      },
    }
  end,
}
