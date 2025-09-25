vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		local function apply_matches()
			-- clear previous match (if any)
			if vim.b._md_red_match_id then
				pcall(vim.fn.matchdelete, vim.b._md_red_match_id)
				vim.b._md_red_match_id = nil
			end

			local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
			local poslist = {}

			for lnum, line in ipairs(lines) do
				local start = 1
				while true do
					-- Lua pattern finds the whole '==word=='; capture ignored here because we want positions
					local s, e = string.find(line, "==([^=]+)==", start)
					if not s then break end
					-- inner start column: s + 2 (skip the leading "==")
					local inner_start = s + 2
					-- inner length: full_match_len - 4 (remove both '==')
					local inner_len = (e - s + 1) - 4
					if inner_len > 0 then
						table.insert(poslist, { lnum, inner_start, inner_len })
					end
					start = e + 1
				end
			end

			if #poslist > 0 then
				-- matchaddpos accepts a list of {lnum, col, len} positions
				vim.b._md_red_match_id = vim.fn.matchaddpos('MarkdownHighlightRed', poslist, 100)
			end
		end

		-- initial apply
		apply_matches()

		-- reapply on common edit events so matches stay in sync
		vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufWritePost", "BufEnter" }, {
			buffer = 0,
			callback = apply_matches,
		})
	end,
})
