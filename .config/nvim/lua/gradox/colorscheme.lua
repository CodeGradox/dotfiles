-- Color schemes

vim.opt.background = "light"
vim.cmd [[colorscheme onehalf-lush]]

-- Disable nvim background
vim.cmd [[hi Normal guibg=NONE]]

-- Colors for diff in vim-fugitive. Matches the onehalf-lush theme.
vim.cmd [[hi diffAdded guifg=#50A14F guibg=NONE]]
vim.cmd [[hi diffRemoved guifg=#E45649 guibg=NONE]]
vim.cmd [[hi diffChanged guifg=#C18401 guibg=NONE]]

-- Highlight unwanted spaces in bright red.
vim.cmd [[hi Whitespace guifg=#FFFFFF guibg=#E45649]]
