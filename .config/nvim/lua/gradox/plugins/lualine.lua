-- NOTE: Plugins are loaded by gradox.plugin_manager.lua
-- The status bar at the bottom of the window.
require("lualine").setup {
  options = {
    theme = "ayu_light",
    section_separators = '',
    component_separators = '|',
    -- globalstatus = 3,
  },
  sections = {
    lualine_b = {
      {
        "branch",
        "diff",
      }
    },
    lualine_c = {
      {
        "filename",
        -- Show relative path.
        path = 1,
      }
    },
    lualine_x = {
      "diagnostics",
      "encoding",
      {
        "fileformat",
        icons_enabled = false
      },
      -- "filetype",
    }
  },
  -- Vim fugitive, show git status in the status bar.
  extensions = { "fugitive" },
}
