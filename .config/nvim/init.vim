" Vimrc sample for how to use vim-plug: /usr/share/vim-plug/vimrc.sample
call plug#begin('~/.vim/plugged')

" A collection of common configurations for Neovim's built-in language server
" client.
Plug 'neovim/nvim-lspconfig'

" Enable treesitter. It's still considered experimental.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Enchance netrw
Plug 'tpope/vim-vinegar'

" Git wrapper for vim.
Plug 'tpope/vim-fugitive'

" Easily manage surrounding parentheses, brackets, quoutes, HTML tags and more.
" Keys: cs<char_from><char_to>
" Example: cs"' to change surrounding " to '
Plug 'tpope/vim-surround'

" Automatically end certain structutes such as 'end' in Ruby.
Plug 'tpope/vim-endwise'

" Comment stuff out.
" Keys: gc
" Uncomment: gcgc
Plug 'tpope/vim-commentary'

" Extends support for abbreviations, substitutions and coercions.
" Abbreviation: Create powerful abbreviations
" Abolish will include upper and lower case words.
" Substitution: Better :s and :%s command
" :%s/facility/building/g will not convert plural and singular versions of the
" words. Subvert/facilit{y,ies}/building{,s}/g will substitute the words
" correcly.
" Coercion: Convert word from one case to another.
" crs       - snake_case
" crm       - MixedCase
" crc       - camelCase
" cru       - UPPER_CASE
" cr-       - dash-case
" cr.       - dot.case
" cr<space> - space case
" crt       - Title Case
Plug 'tpope/vim-abolish'

" Colorschemes
Plug 'rktjmp/lush.nvim'
Plug 'CodeGradox/onehalf-lush'
" Plug '~/projects/onehalf-lush'

" Telescope, a highly extendable fuzzy finder.
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Native C port of fzf.
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make', 'branch': 'main' }

" Show git diffs inside a file.
Plug 'mhinz/vim-signify'

" Status/tabline, at the bottom of the editor.
Plug 'hoob3rt/lualine.nvim'

" Visualize indentation.
Plug 'lukas-reineke/indent-blankline.nvim'

" Vim mappings for copying/pasting text to the os specific clipboard.
" Copy: cp
" Copy line: cP
" Paste: cv
" Paste to the next line: cV
Plug 'christoomey/vim-system-copy'

" Automatically end quotes, parenthesis, brackets and more.
Plug 'raimondi/delimitmate'

" An motion plugin for neovim.
Plug 'ggandor/lightspeed.nvim'

" A pretty list for showing diagnostics, references, telescope results,
" quickfix and location lists to help you solve all the trouble your code is
" causing.
Plug 'folke/trouble.nvim'

"""" SYNTAX HIGHLIGHTLING """"

" Highlight cells in CSV files.
" Allows me to query data in CSV with a SQL like syntax.
Plug 'mechatroner/rainbow_csv'

" Slim template language.
Plug 'slim-template/vim-slim'

" Support for Ruby on Rails.
Plug 'tpope/vim-rails'

call plug#end()

" Map leader key to space.
let mapleader = " "

" Find files using Telescope command-line sugar.
map <leader>p :Telescope git_files<cr>
map <leader>o :Telescope live_grep<cr>
map <leader>gco :Telescope git_branches<cr>

" Quickfix list shortcuts.
" Next item.
map <leader>j :cn<CR>
" Previous item.
map <leader>k :cp<CR>

" Make it easier to switch windows.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-q> <C-\><C-n>

" Shift + J/K moves selected lines down/up in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Highlight certain characters.
set list
" Highlights weird whitespaces such as 0x00A0 non-breaking space.
set listchars=tab:>\ ,extends:>,precedes:<,nbsp:¿

" Enable syntax highlight
syntax on
" Show linenumbers
set number
set relativenumber
set termguicolors
set cursorline
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set ignorecase
set smartcase
set mouse=a
" Vertical split to the right
set splitright
" Horisontal split to the left
set splitbelow
set lazyredraw
set wildmode=longest:full,full

" Highlight and show substitutions incrementally as you write them.
set inccommand=split

" Make nvim use ripgrep when calling :grep.
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Overwrite global rules for certain filetypes.
autocmd Filetype rs setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.caracal set syntax=ruby
autocmd BufNewFile,BufRead *.thor set syntax=ruby
" Tell CSV rainbow we like to separtate columns with commas.
autocmd BufNewFile,BufRead *.csv set filetype=csv
" Trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Abbreviations
iabbrev ammount amount
iabbrev desciption description
iabbrev recieve receive

" Color schemes
set background=light
colorscheme onehalf-lush
" Disable nvim background
hi Normal guibg=NONE

lua << EOF
-- Configure treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    -- Enable better syntax highlights.
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- The status bar at the bottom of the window.
require('lualine').setup {
  options = {
    theme = 'ayu_light',
    section_separators = '',
    component_separators = '|',
  },
  sections = {
    lualine_b = {
      'branch',
      'diff',
    },
    lualine_c = {
      {
        'filename',
        -- Show relative path.
        path = 1,
      }
    },
    lualine_x = {
      'encoding',
      {
        'fileformat',
        icons_enabled = false
      },
      'filetype',
    }
  },
  extensions = { 'fugitive' },
}

-- Telescope, the fuzzy-finder
require('telescope').setup{
  defaults = {},
  pickers = {
    find_files = {
      theme = "dropdown"
    },
    git_files = {
      theme = "dropdown"
    },
    live_grep = {
      theme = "dropdown"
    },
  },
}

-- Telescope extensions.
require'telescope'.load_extension('fzf')

-- Indent Blankline
require'indent_blankline'.setup{
  space_char_blankline = " ",
  show_current_context = true,
}


-- Trouble
require("trouble").setup{
  icons = false,
  signs = {
    error = "omg",
    warning = "hmm",
    hint = "hey",
    information = "fyi",
  },
}

----- Language Server Protocol (LSP) -----

-- gem install solargraph
require 'lspconfig'.solargraph.setup{
  flags = {
    debounce_text_changes = 150,
  }
}

-- gem install solargraph
require 'lspconfig'.solargraph.setup{}

-- npm -g install typescript typescript-language-server
require 'lspconfig'.tsserver.setup{}

-- npm -g install vls
require 'lspconfig'.vuels.setup{
  settings = {
    vetur = {
      -- Vls requires a jsconfig.json or tsconfig.json. Ignore that requirement.
      ignoreProjectWarning = true
    }
  }
}
EOF

""""" Plugin settings """""

" Disable the buildt in Ruby provider to speed up startup times.
" LSP will handle Ruby files anyway.
let g:loaded_ruby_provider = 0

" Signify, the git diff plugin.
let g:signify_sign_add = "▋"
let g:signify_sign_delete = "▋"
let g:signify_sign_delete_first_line = "▋"
let g:signify_sign_change = "▋"
let g:signify_sign_chak = "▋"

" Should make vim-vue faster by not loading all processors at once.
let g:vue_pre_processors='detect_on_enter'

let g:rails_projections = {
  \ 'app/javascript/packs/*.js': { 'command': 'pack' },
  \ 'app/javascript/controllers/*.js': { 'command': 'stimulus' },
  \ 'app/javascript/apps/*.vue': { 'command': 'apps' },
  \ 'app/services/*.rb': { 'command': 'service' },
  \ 'app/datatables/*_datatable.rb': { 'command': 'datatable' },
  \ 'test/models/*_test.rb': { 'command': 'test' },
  \ 'test/controllers/*_test.rb': { 'command': 'test' },
  \ 'test/factories/*.rb': { 'command': 'factory' },
  \ 'lib/tasks/*.thor': { 'command': 'task' }
  \ }
