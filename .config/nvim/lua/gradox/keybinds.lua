-- Keybindings

-- Shortuct for setting keymaps
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- nnoremap
function nmap(shortcut, command)
  map("n", shortcut, command)
end

-- vnoremap
function vmap(shortcut, command)
  map("v", shortcut, command)
end

-- tnoremap
function tmap(shortcut, command)
  map("t", shortcut, command)
end

-- Map leader key to space
vim.g.mapleader = " "

-- Find files using Telescope command-line sugar.
nmap("<leader>p", ":Telescope git_files<cr>")
nmap("<leader>p", ":Telescope git_files<cr>")
nmap("<leader>o", ":Telescope live_grep<cr>")
nmap("<leader>gco", ":Telescope git_branches<cr>")

-- Quickfix list shortcuts.
--Next item.
nmap("<leader>j", ":cn<CR>")
-- Previous item.
nmap("<leader>k", ":cp<CR>")

-- Make it easier to switch windows.
-- Ctrl + h, j, k or w to jump between splits.
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Exit edit mode in terminal, I think.
tmap("<C-q>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Shift + J/K moves selected lines down/up in visual mode
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")
