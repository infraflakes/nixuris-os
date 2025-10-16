-- Find git repositories and cd into them
_G.OpenGitRepoPicker = function()
	local actions = require "telescope.actions"
	local action_state = require "telescope.actions.state"
	local pickers = require "telescope.pickers"
	local finders = require "telescope.finders"
	local sorters = require "telescope.config".values

	local repos = {}
	-- Reverted to the original, working find command with io.popen
	local cmd = [[find $HOME -type d -name ".git" -prune -not -path "$HOME/.*" -not -path "$HOME/.*/**" 2>/dev/null]]
	local handle = io.popen(cmd)
	if handle then
		local result = handle:read("*a")
		handle:close()
		for line in string.gmatch(result, "[^\r\n]+") do
			table.insert(repos, (line:gsub("/%.git$", "")))
		end
	end

	if #repos == 0 then
		vim.notify("No Git repositories found.", vim.log.levels.WARN)
		return
	end

	pickers.new({}, {
		prompt_title = "Git Repositories",
		finder = finders.new_table { results = repos },
		sorter = sorters.file_sorter {},
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				local selection = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd("cd " .. vim.fn.fnameescape(selection[1]))
				vim.notify("cd " .. selection[1])
			end)
			return true
		end,
	}):find()
end

-- Register Vim command
vim.cmd [[ command! OpenGitRepos lua _G.OpenGitRepoPicker() ]]
