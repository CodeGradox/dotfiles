" Vimrc sample for how to use vim-plug: /usr/share/vim-plug/vimrc.sample
call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'

" Enable treesitter. It's still considered experimental.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'glepnir/lspsaga.nvim'

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
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" FZF integration.
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Telescope, a highly extendable fuzzy finder.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Show git diffs inside a file.
Plug 'mhinz/vim-signify'

" Syntaxchecker.
Plug 'dense-analysis/ale'

" Status/tabline, at the bottom of the editor.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Visualize indentation.
Plug 'Yggdroot/indentLine'

" Vim mappings for copying/pasting text to the os specific clipboard.
" Copy: cp
" Copy line: cP
" Paste: cv
" Paste to the next line: cV
Plug 'christoomey/vim-system-copy'

" Automatically end quotes, parenthesis, brackets and more.
Plug 'raimondi/delimitmate'

" Highlight cells in CSV files.
" Allows me to query data in CSV with a SQL like syntax.
Plug 'mechatroner/rainbow_csv'

"""" SYNTAX HIGHLIGHTLING """"

" Fish shell.
Plug 'dag/vim-fish'

" Slim template language.
Plug 'slim-template/vim-slim'

" Support for Ruby on Rails.
Plug 'tpope/vim-rails'

" Syntax highlight for Pug templates inside Vue files.
Plug 'digitaltoad/vim-pug'

call plug#end()

" Map leader key to space.
let mapleader = " "

" Maps Leader+p to run :Files (fzf).
map <leader>p :Files<Cr>
map <leader>o :Rgi<Cr>

" Make it easier to switch windows.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-q> <C-\><C-n>

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
set encoding=utf-8
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
set wildmenu
set wildmode=longest:full,full

" Helps with some styles breaking on some files (scss).
" https://github.com/vim/vim/issues/2049#issuecomment-494923065
set mmp=5000

" Highlight and show substitutions incrementally as you write them.
set inccommand=split

" Overwrite global rules for certain filetypes.
autocmd Filetype rs setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.caracal set syntax=ruby
autocmd BufNewFile,BufRead *.thor set syntax=ruby
" Tell CSV rainbow we like to separtate columns with commas.
autocmd BufNewFile,BufRead *.csv set filetype=csv

" Abbreviations
iabbrev laft LAFT
iabbrev ammount amount

" Color schemes
colorscheme onehalflight
let g:airline_theme="papercolor"
" Disable nvim background
hi Normal guibg=NONE

" indentLine
let g:indentLine_char = '┆'

" Trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Custom commands
" Allow pasting optional flags into the Rg command.
"   Example: :Rg mytem -g '*.md'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

""""" Plugin settings """""

" Signify, the git diff plugin.
let g:signify_sign_add = "▋"
let g:signify_sign_delete = "▋"
let g:signify_sign_delete_first_line = "▋"
let g:signify_sign_change = "▋"
let g:signify_sign_chak = "▋"

" Ale settings.
let g:ale_sign_error = '✘ '
let g:ale_sign_warning = '✘ '

" Should make vim-vue faster by not loading all processors at once.
let g:vue_pre_processors='detect_on_enter'

" Use Sway spesific clipboard.
let g:system_copy#copy_command='wl-copy'
let g:system_copy#paste_command='wl-paste'

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
