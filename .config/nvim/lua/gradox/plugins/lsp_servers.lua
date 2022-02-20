-- NOTE: Plugins are loaded by gradox.plugin_manager.lua
-- Language Server Protocol (LSP)

-- Ruby
-- gem install solargraph
require("lspconfig").solargraph.setup {
  flags = {
    debounce_text_changes = 150,
  }
}

-- Javascript and typescript
-- npm -g install typescript typescript-language-server
require("lspconfig").tsserver.setup {}

-- Vue
-- npm -g install vls
require("lspconfig").vuels.setup {
  settings = {
    vetur = {
      -- Vls requires a jsconfig.json or tsconfig.json. Ignore that requirement.
      ignoreProjectWarning = true
    }
  }
}
