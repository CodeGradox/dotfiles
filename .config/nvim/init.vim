set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/usr/share/vim/vimfiles/autoload/vundle.vim
call vundle#begin()

" Enchance netrw
Plugin 'tpope/vim-vinegar'

" Colorschemes
Plugin 'sonph/onehalf', {'rtp': 'vim/'}

" FZF integration.
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Git wrapper for vim.
Plugin 'tpope/vim-fugitive'
Plugin 'tommcdo/vim-fubitive'

" Show git diffs inside a file.
Plugin 'mhinz/vim-signify'

" Syntaxchecker.
Plugin 'dense-analysis/ale'

" Status/tabline, at the bottom of the editor.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Visualize indentation.
Plugin 'Yggdroot/indentLine'

" Easily manage surrounding parentheses, brackets, quoutes, HTML tags and more.
" Keys: cs<char_from><char_to>
" Example: cs"' to change surrounding " to '
Plugin 'tpope/vim-surround'

" Comment stuff out.
" Keys: gc
" Uncomment: gcgc
Plugin 'tpope/vim-commentary'

" Vim mappings for copying/pasting text to the os specific clipboard.
" Copy: cp
" Copy line: cP
" Paste: cv
" Paste to the next line: cV
Plugin 'christoomey/vim-system-copy'

" Automatically end certain structutes such as 'end' in Ruby.
Plugin 'tpope/vim-endwise'

" Automatically end quotes, parenthesis, brackets and more.
Plugin 'raimondi/delimitmate'

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
map <leader>o :Rg<Cr>

" Make it easier to switch windows.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-q> <C-\><C-n>

" set path+=**

" Highlight certain characters.
" set list
" Highlights weird whitespaces such as 0x00A0 non-breaking space.
" set listchars=nbsp:¿

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

autocmd Filetype rs setlocal tabstop=4 shiftwidth=4 softtabstop=4

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
  \ 'app/services/*.rb': { 'command': 'service' },
  \ 'app/datatables/*_datatable.rb': { 'command': 'datatable' },
  \ 'test/models/*_test.rb': { 'command': 'test' },
  \ 'test/controllers/*_test.rb': { 'command': 'test' },
  \ 'test/factories/*.rb': { 'command': 'factory' },
  \ 'lib/tasks/*.thor': { 'command': 'task' }
  \ }

" Based on https://developpaper.com/use-the-floating-window-of-neovim-to-make-you-fall-in-love-with-fzf-again
" and https://github.com/neovim/neovim/pull/6619
function! OpenFloatWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " Set the position, size, etc. of the floating window.
  " The size configuraion here may not be so flexible, and there's room for
  " further improvement.
  let opts = {
    \ 'relative': 'editor',
    \ 'row': height * 0.3,
    \ 'col': col + 30,
    \ 'width': width * 2 / 3,
    \ 'height': height / 2
    \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " Set Floating Window Highlighting
  call setwinvar(win, '&winhl', 'Normal:Pmeny')

  setlocal
    \ buftype=nofile
    \ nobuflisted
    \ bufhidden=hide
    \ nonumber
    \ norelativenumber
    \ signcolumn=no

  set winhl=Normal:Floating
  hi Floating guibg=#F2F3F5
endfunction

" let g:fzf_layout = { 'window': 'call OpenFloatWin()' }
