-- General settings.

-- The options in this file are pretty much the same as you'll find in other
-- neovim config. The difference between a vimscript and a Lua version, is that
-- in Lua, we use `vim.opt.setting = value` to set the setting.

-- NOTE: a lot of neovim users like to create short aliases, such as `local o =
-- vim.opt`. Personally, I think it makes the file more cryptic, and therefore
-- harder to understand for other people who are new to Lua. Therefore, I have
-- opted to use the standard `vim.opt` command.

-- Enable syntax highlight.
vim.opt.syntax = "on"

-- Show linenumbers.
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable 24-bit RGB color in the TUI.
vim.opt.termguicolors = true

-- Highlight the current line.
vim.opt.cursorline = true

-- Indentation rules.
-- Rules can be overwritten by auto commands, depending on the filetype of the
-- current buffer.
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Use smartcase when searching.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse suppoert.
vim.opt.mouse = "a"

-- Make the window split more intuitive.
-- Vertical split to the right
vim.opt.splitright = true
-- Horisontal split below
vim.opt.splitbelow = true

-- Don't redraw screen when executing macros.
vim.opt.lazyredraw = true

-- Rules for when you're using tab to autocomplete a word. Will complete to the
-- longest common word.
vim.opt.wildmode = "longest:full,full"

-- Highlight and show substitutions incrementally as you write them.
vim.opt.inccommand = "split"

-- Make nvim use ripgrep when calling :grep.
vim.opt.grepprg = "rg --vimgrep --smart-case --follow"

-- Highlights weird whitespaces such as 0x00A0 non-breaking space.
-- vim.opt.listchars = "tab:> ,extends:>,precedes:<,nbsp:¿"
vim.opt.listchars = { extends = ">", precedes = "<", nbsp = "¿" }
-- Highlight certain characters.
vim.opt.list = true

-- Disable the buildt in Ruby provider to speed up startup times. LSP will
-- handle Ruby files anyway.
vim.g["loaded_ruby_provider"] = 0

-- Should make vim-vue faster by not loading all processors at once.
vim.g["vue_pre_processors"] = 'detect_on_enter'
