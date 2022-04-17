-- Autocommands

-- Trim trailing whitespace on save.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = "%s/\\s\\+$//e",
})

-- Overwrite global rules for certain filetypes.
-- Rust
-- vim.cmd [[autocmd filetype rs setlocal tabstop=4 shiftwidth=4 softtabstop=4]]
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rs" },
  command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4",
})

-- Caracal and thor (ruby)
vim.api.nvim_create_autocmd({ "BufNewFile", "BufEnter" }, {
  pattern = { "*.thor", "*.caracal" },
  command = "set syntax=ruby",
})
