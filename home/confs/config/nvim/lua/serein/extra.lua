vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.fn.matchadd('MarkdownHighlightRed', '==\\zs[^=]\\+\\ze==', 100)
  end,
})
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.fn.matchadd('MarkdownHighlightRed', '==\\zs[^=]\\+\\ze==', 100)
      end,
    })
  end,
})
