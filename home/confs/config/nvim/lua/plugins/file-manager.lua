return {

	{ -- telescope with hidden files + fzf-native
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope = require "telescope"

			telescope.setup {
				defaults = {
					file_ignore_patterns = {
						"__pycache__/",
						"%.mkv", "%.png", "%.pdf", "%.xlxs",
						"Games/", "Pictures/", "Downloads/", "Music/", "Videos/",
					},
				},
				pickers = { find_files = { hidden = true } },
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			}
			telescope.load_extension "fzf" -- ONLY fzf, no tmux_sessions here

			-- standalone picker (NOT an extension)
			local function tmux_sessions(opts)
				opts = opts or {}
				local Job = require "plenary.job"
				local results = {}
				Job:new({
					command = "tmux",
					args = { "ls" },
					on_stdout = function(_, d)
						results[#results + 1] =
						    d
					end
				}):sync()

				local actions = require "telescope.actions"
				local state   = require "telescope.actions.state"

				local pickers = require "telescope.pickers"
				pickers.new(opts, {
					prompt_title = "  Tmux Sessions",
					finder = require("telescope.finders").new_table { results = results },
					sorter = require("telescope.config").values.generic_sorter(opts),
					attach_mappings = function(_, map)
						map({ "i", "n" }, "<CR>", function(prompt_bufnr)
							local selection = require("telescope.actions.state")
							.get_selected_entry()
							if selection then
								require("telescope.actions").close(prompt_bufnr)
								vim.fn.system("tmux switch-client -t " ..
								selection[1]:match "^([^:]+)")
							end
						end)
						return true
					end,
				}):find()
			end

			-- key-map that calls the plain function
			vim.keymap.set("n", "<leader>fs", tmux_sessions, { desc = "find tmux session" })
		end,
	},

	-- Neo-tree
	{
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
					picker = "default", -- also accepts "fzf" if you got telescope or fzf
					exclude = {
						filetype = { "neo-tree", "neo-tree-popup", "notify" },
						buftype = { "terminal", "quickfix", "nofile" },
					},
				},
			}
		end,
	},
}
