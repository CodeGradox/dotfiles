require("gradox.plugin_manager")
require("gradox.keybinds")
require("gradox.settings")
require("gradox.autocmd")
require("gradox.abbreviations")
require("gradox.colorscheme")

-- Welcome to my neovim config!

-- The config is written in Lua and has been split into multiple files. The
-- `require` call at the top of this file will load all the settings. I'm using
-- Packer for managing the plugins. Their website explains how to install the
-- plugin manager and how to download the plugins.

-- All the config files are placed in ~/.config/nvim/lua/gradox. When calling
-- `require`, Lua will look for files in the lua folder. It seems that neovim
-- users with Lua configs have an additional folder inside the lua folder. I
-- think this is to namespace the config files to avoid any namespace issues
-- with native Lua libraries.

-- Tutorials and reference repos:
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua
-- https://www.notonlycode.org/neovim-lua-config
-- https://github.com/numToStr/dotfiles/tree/master/neovim/.config/nvim
