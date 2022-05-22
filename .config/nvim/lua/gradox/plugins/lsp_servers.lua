-- NOTE: Plugins are loaded by gradox.plugin_manager.lua
-- Language Server Protocol (LSP)

local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
  -- Shortcuts for keymaps and option setter.
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }
  -- Show line diagnostics.
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- Go to previous diagnostic.
  buf_set_keymap('n', '<space>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  -- Go to next diagnostic.
  buf_set_keymap('n', '<space>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- Show all diagnostics.
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

-- Ruby
-- gem install solargraph
nvim_lsp.solargraph.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

-- Javascript and typescript
-- npm -g install typescript typescript-language-server
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
}

-- Vue
-- npm -g install vls
nvim_lsp.vuels.setup {
  on_attach = on_attach,
  settings = {
    vetur = {
      -- Vls requires a jsconfig.json or tsconfig.json. Ignore that requirement.
      ignoreProjectWarning = true
    }
  }
}
