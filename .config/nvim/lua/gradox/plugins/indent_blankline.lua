-- NOTE: Plugins are loaded by gradox.plugin_manager.lua
-- Indent Blankline
vim.cmd [[highlight IndentBlanklineContextChar1 guifg=#E5E5E5 gui=nocombine]]

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
}
