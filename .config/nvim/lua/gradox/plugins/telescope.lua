-- NOTE: Plugins are loaded by gradox.plugin_manager.lua
-- Telescope, the fuzzy-finder
require("telescope").setup {
  defaults = {},
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    git_files = {
      theme = "dropdown",
      previewer = false,
    },
    live_grep = {
      theme = "dropdown"
    },
  },
}
