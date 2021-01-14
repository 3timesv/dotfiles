" Options {{{
"
" switch from the default Vi-compatibility mode and enables useful Vim functionality. 
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" relativenumber enabled
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" backspace over anything.
set backspace=indent,eol,start


" search case-insensitive all characters lowercase. However, case-sensitive if
" any capital 
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" vim theme in tmux
set background=dark
set t_Co=256
" }}}


" mapleader 
let mapleader = "-"

" filetype plugin On for vim-instant-markdown and vimwiki
filetype plugin on

" tab 4 spaces wide
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" highlight search
set hlsearch
set incsearch

" Mappings {{{
" Edit my vimrc file in vsplit 
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source my vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" put double quotes around current word and leave cursor on ending quote
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" put single quotes around current word and leave cursor on ending quote
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" goto end of line with L
nnoremap L $

" goto start of line with H
nnoremap H 0

" map jk to <esc>
inoremap jj <esc>
inoremap <esc> <nop>

" (un)comment python block
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> <leader># :s/^#//<cr>:noh<cr>
" }}}

" Try to prevent bad habits like using the arrow keys for movement. {{{
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
" }}}

" vim-plug {{{
call plug#begin()
Plug 'vimwiki/vimwiki'
Plug 'ron89/thesaurus_query.vim'
Plug 'reedes/vim-pencil'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
call plug#end()
" }}}

" vimwiki defaults {{{
let notes = {}
let notes.path = '~/me/notes/'
let notes.path_html = 'me/notes_html/'
let notes.syntax = 'markdown'
let notes.ext = '.md'

let zettels = {}
let zettels.path = '~/me/zettels/'
let zettels.path_html = '~/me/zettels_html/'
let zettels.syntax = 'markdown'
let zettels.ext = '.md'

let twentyone = {}
let twentyone.path = '~/me/twentyone/'
let twentyone.path_html = '~/me/twentyone_html/'
let twentyone.syntax = 'markdown'
let twentyone.ext = '.md'

let g:vimwiki_list = [notes, zettels, twentyone]
" }}}

" status line {{{
let g:airline_theme='minimalist'
" }}}

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType json :%!jq
augroup END
" }}}

" Ale {{{
let g:ale_linters_explicit=1
let g:ale_linters = {
			\ 'python': ['flake8', 'pylint'],      
			\ 'vimwiki': [],
			\ }
let g:ale_fixers = {
			\ 'python': ['autopep8', 'add_blank_lines_for_python_control_statements', 'isort', 'remove_trailing_lines', 'trim_whitespace'],
			\ 'vimwiki': [],
			\ }

nnoremap <silent> <C-k> :ALEPrevious<CR>
nnoremap <silent> <C-j> :ALENext<CR> 
" }}}

" Experiment {{{
" Match traling whitespaces
nnoremap <leader>w :match Error /\v\s+$/<CR>

" Clear the match
nnoremap <leader>W :match none<CR>
" }}}

" vimtex {{{
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_general_viewer = 'okular'
" }}}

" {{{ Misc.
au VimLeave * if filereadable("~/dotfiles/.vim/.netrwhist")|call delete("~/dotfiles/.vim/.netrwhist")|endif
" }}}


