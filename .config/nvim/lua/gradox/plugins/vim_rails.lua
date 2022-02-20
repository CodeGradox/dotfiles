-- NOTE: Plugins are loaded by gradox.plugin_manager.lua
-- NOTE: this plugin is written in vimscript
-- Projections for Ruby on Rails projects.
vim.cmd [[
  let g:rails_projections = {
    \ 'app/services/*.rb': { 'command': 'service' },
    \ 'app/datatables/*_datatable.rb': { 'command': 'datatable' },
    \ 'test/models/*_test.rb': { 'command': 'test' },
    \ 'test/controllers/*_test.rb': { 'command': 'test' },
    \ 'test/factories/*.rb': { 'command': 'factory' },
    \ 'lib/tasks/*.thor': { 'command': 'task' }
    \ }
]]
