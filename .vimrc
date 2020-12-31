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
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install'}
Plug 'vimwiki/vimwiki'
call plug#end()
" }}}

" vimwiki defaults {{{
let notes = {}
let notes.path = '~/vimwiki/notes/'
let notes.path_html = 'vimwiki/notes_html/'
let notes.syntax = 'markdown'
let notes.ext = '.md'

let zettels = {}
let zettels.path = '~/vimwiki/zettels/'
let zettels.path_html = '~/vimwiki/zettels_html/'
let zettels.syntax = 'markdown'
let zettels.ext = '.md'

let twentyone = {}
let twentyone.path = '~/vimwiki/twentyone/'
let twentyone.path_html = '~/vimwiki/twentyone_html/'
let twentyone.syntax = 'markdown'
let twentyone.ext = '.md'

let g:vimwiki_list = [notes, zettels, twentyone]
" }}}

" status line {{{
set statusline=%f   " Path to the file
set statusline+=\ %m " Space and -
set statusline+=\ %y " filetype
set statusline+=%=  " switch to right
set statusline+=%p%% " percentage through file
set statusline+=\  " separator
set statusline+=\  " separator
set statusline+=\  " separator
set statusline+=%-3l  " current line
" }}}

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType json :%!jq
augroup END
" }}}

let g:pydocstring_doq_path = "/home/vivek/.local/bin/doq"
let g:pydocstring_formatter = 'numpy'
nnoremap <leader>ds :Pydocstring<CR> 

