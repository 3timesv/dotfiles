" Options {{{
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
" }}}

" mapleader 
let mapleader = "-"

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

" auto-close brackets
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
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
Plug 'preservim/NERDTree'
Plug 'vimwiki/vimwiki'
Plug 'davidhalter/jedi-vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'python-mode/python-mode', {'for': 'python', 'branch': 'develop'}
call plug#end()
" }}}

" vimwiki defaults {{{
let g:vimwiki_list = [{
    \ 'path_html' : '$HOME/Documents/vimwiki/notes_html',
    \ 'path' : '$HOME/Documents/vimwiki/notes',
    \}]
" }}}

" status line {{{
set statusline=%f   " Path to the file
set statusline+=\ %m " Space and -
set statusline+=\ %y " filetype
set statusline+=%=  " switch to right
set statusline+=--%p-- " percentage through file
set statusline+=%5l  " current line
set statusline+=/   " separator
set statusline+=%-5L  " total lines
" }}}

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" pymode 

let g:pymode_options_colorcolumn = 0
let g:pymode = 1
let g:pymode_motion = 1
