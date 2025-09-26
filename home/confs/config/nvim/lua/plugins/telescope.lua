return { -- telescope with hidden files + fzf-native
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
		function _G.ToggleTmuxSessions(opts)
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
						local selection = require("telescope.actions.state").get_selected_entry()
						if selection then
							require("telescope.actions").close(prompt_bufnr)
							local session_name = selection[1]:match("^([^:]+)")
							local Terminal = require("toggleterm.terminal").Terminal
							local term = Terminal:new({
								cmd = "tmux attach -t " .. session_name,
								direction = "float",
								float_opts = {
									border = "rounded",
									width = math.floor(vim.o.columns * 0.85),
									height = math.floor(vim.o.lines * 0.80),
								},
								autoclose = true,
							})
							term:open()
							vim.schedule(function()
								vim.cmd "startinsert"
							end)
						end
					end)
					return true
				end,
			})
		end

		-- key-map that calls the plain function
		vim.keymap.set("n", "<leader>fs", _G.ToggleTmuxSessions, { desc = "find tmux session" })
		vim.cmd [[ command! ToggleTmux lua _G.ToggleTmuxSessions() ]]


	end,
}
