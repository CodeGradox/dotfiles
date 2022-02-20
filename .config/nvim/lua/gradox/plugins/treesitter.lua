-- NOTE: Plugins are loaded by gradox.plugin_manager.lua
-- Configure treesitter
require("nvim-treesitter.configs").setup {
  highlight = {
    -- Enable better syntax highlights.
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
