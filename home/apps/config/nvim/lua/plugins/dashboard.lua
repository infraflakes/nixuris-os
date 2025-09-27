return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VimEnter",

		config = function()
			local alpha = require "alpha"
			local dashboard = require "alpha.themes.dashboard"
			local palette = require("tokyonight.colors").setup()
			local cool_blue = palette.blue
			local soft_grey = palette.comment

			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = function()
					vim.api.nvim_set_hl(0, "Type", { fg = cool_blue, bold = true }) -- ascii header
					vim.api.nvim_set_hl(0, "Keyword", { fg = cool_blue }) -- button keys
					vim.api.nvim_set_hl(0, "Function", { fg = soft_grey }) -- button desc
				end,
			})
			vim.api.nvim_exec_autocmds("ColorScheme", { pattern = "*" })
			-- Define Main Dashboard
			function OpenMainDashboard()
				dashboard.section.header.val = {
					"███████╗███████╗██████╗ ███████╗██╗███╗   ██╗",
					"██╔════╝██╔════╝██╔══██╗██╔════╝██║████╗  ██║",
					"███████╗█████╗  ██████╔╝█████╗  ██║██╔██╗ ██║",
					"╚════██║██╔══╝  ██╔══██╗██╔══╝  ██║██║╚██╗██║",
					"███████║███████╗██║  ██║███████╗██║██║ ╚████║",
					"╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝",
					"               Welcome back ",
				}

				dashboard.section.buttons.val = {
					dashboard.button("g", "  Git Repositories", ":OpenGitRepos <CR>"),
					dashboard.button("s", "  Tmux Sessions", ":ToggleTmux<CR>"),
					dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
					dashboard.button("ff", "󰈞  Find Files", ":Telescope find_files<CR>"),
					dashboard.button("fg", "󰱼  Grep Text", ":Telescope live_grep<CR>"),
					dashboard.button("fr", "  Recent Files", ":Telescope oldfiles<CR>"),
					dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
				}

				alpha.setup(dashboard.config)
				vim.schedule(function()
					vim.cmd "stopinsert | redraw!"
				end)
			end

			-- Initialize Main Dashboard
			OpenMainDashboard()
			vim.keymap.set("n", "<leader>dd", "<cmd>Alpha<CR>", { desc = "Reopen [D]ash[D]oard" })
		end,
	},
}
