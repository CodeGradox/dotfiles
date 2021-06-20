set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/usr/share/vim/vimfiles/autoload/vundle.vim
call vundle#begin()

" Enchance netrw
Plugin 'tpope/vim-vinegar'

" Git wrapper for vim.
Plugin 'tpope/vim-fugitive'

" Easily manage surrounding parentheses, brackets, quoutes, HTML tags and more.
" Keys: cs<char_from><char_to>
" Example: cs"' to change surrounding " to '
Plugin 'tpope/vim-surround'

" Automatically end certain structutes such as 'end' in Ruby.
Plugin 'tpope/vim-endwise'

" Comment stuff out.
" Keys: gc
" Uncomment: gcgc
Plugin 'tpope/vim-commentary'

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
Plugin 'tpope/vim-abolish'

" Colorschemes
Plugin 'sonph/onehalf', {'rtp': 'vim/'}

" FZF integration.
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Show git diffs inside a file.
Plugin 'mhinz/vim-signify'

" Syntaxchecker.
Plugin 'dense-analysis/ale'

" Status/tabline, at the bottom of the editor.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Visualize indentation.
Plugin 'Yggdroot/indentLine'

" Vim mappings for copying/pasting text to the os specific clipboard.
" Copy: cp
" Copy line: cP
" Paste: cv
" Paste to the next line: cV
Plugin 'christoomey/vim-system-copy'

" Automatically end quotes, parenthesis, brackets and more.
Plugin 'raimondi/delimitmate'

" Highlight cells in CSV files.
" Allows me to query data in CSV with a SQL like syntax.
Plugin 'mechatroner/rainbow_csv'

"""" SYNTAX HIGHLIGHTLING """"

" Vim syntax highlight.
Plugin 'dag/vim-fish'

" Slim template language.
Plugin 'slim-template/vim-slim'

" Support for Ruby.
Plugin 'vim-ruby/vim-ruby'

" Support for Ruby on Rails.
Plugin 'tpope/vim-rails'

" Syntax highlight for Vue files.
Plugin 'posva/vim-vue'

" Syntax highlight for Pug templates inside Vue files.
Plugin 'digitaltoad/vim-pug'

" Rust extension.
Plugin 'rust-lang/rust.vim'

" Syntax highlight for Javascript files.
Plugin 'pangloss/vim-javascript'

" Syntax highlight for JSON files.
Plugin 'elzr/vim-json'

" Svelte, a JS frontend framework.
Plugin 'evanleck/vim-svelte'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
set listchars=nbsp:¿

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
" Tell CSV rainbow we like to separtate columns with commas.
autocmd BufNewFile,BufRead *.csv set filetype=csv

" Abbreviations
iabbrev laft LAFT

" Color schemes
colorscheme onehalflight
let g:airline_theme="papercolor"
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#buffer_nr_show = 1
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

" Interactive search with ripgrep and preview with fzf.
" https://sidneyliebrand.io/blog/how-fzf-and-ripgrep-improved-my-workflow?source=post_page
command! -bang -nargs=* Rgi
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%'),
  \   <bang>0)

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
