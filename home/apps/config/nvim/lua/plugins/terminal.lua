return {
	-- 1. rounded floating terminal that follows your cd
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		cmd = { 'ToggleTerm', 'Term' },
		keys = {
			{ '<leader>t', '<cmd>Term<CR>', desc = 'floating terminal' },
		},
		opts = {
			direction = 'float',
			float_opts = {
				border = 'rounded',
				width = math.floor(vim.o.columns * 0.85),
				height = math.floor(vim.o.lines * 0.80),
			},
			on_create = function(t)
				vim.api.nvim_create_autocmd('DirChanged', {
					buffer = t.bufnr,
					callback = function()
						vim.loop.chdir(vim.b[t.bufnr].changedtick and vim.fn.getcwd(t.bufnr) or
							t.dir)
					end,
				})
			end,
		},
		config = function(_, opts)
			require('toggleterm').setup(opts)
			vim.api.nvim_create_user_command('Term', function()
				require('toggleterm').toggle(1, nil, nil, 'float', nil)
			end, {})
		end,
	},
}
