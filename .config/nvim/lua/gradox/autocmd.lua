-- Autocommands
-- It does not look like there is a lua function for setting autommands, so we
-- use `vim.cmd`.

-- Trim trailing whitespace on save.
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e]]

-- Overwrite global rules for certain filetypes.
-- Rust
vim.cmd [[autocmd filetype rs setlocal tabstop=4 shiftwidth=4 softtabstop=4]]
-- Caracal (ruby)
vim.cmd [[autocmd BufNewFile,BufRead *.caracal set syntax=ruby]]
-- Thor (ruby)
vim.cmd [[autocmd BufNewFile,BufRead *.thor set syntax=ruby]]
-- Tell CSV rainbow we like to separtate columns with commas.
vim.cmd [[autocmd BufNewFile,BufRead *.csv set filetype=csv]]
