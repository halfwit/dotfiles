
" Vim-plug ----------------------------------------{{{
call plug#begin("$XDG_DATA_HOME/plugged")

" Make sure you use single quotes
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
call plug#end()
" }}}

" Ironic, folding settings!------------------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"Remove trailing whitespace haxx
autocmd! BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost * Neomake

" Simple plugin settings ------{{{
colorscheme gruvbox
set background=light
let g:gruvbox_italicize_comments = 0
let g:gruvbox_contrast_light = "hard"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:indentLine_char = '┆'
"let g:deoplete#enable_ignore_case = 'ignorecase'
"let g:deoplete#sources = {}
"let g:deoplete#sources_ = ['buffer','tag']
"let g:deoplete#auto_completion_start_length = 1
"let g:deoplete#enable_smart_case = 1
" }}}

" General Settings ------------------{{{
filetype indent plugin on
set softtabstop=4
set shiftwidth=4
set expandtab
set title
set hidden
set number
set smartcase
set ignorecase
syntax on

" }}}

" Cheater window nav ---- {{{
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-k>k
noremap <C-l> <C-w>l
" }}}


