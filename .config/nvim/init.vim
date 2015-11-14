
call plug#begin("$XDG_DATA_HOME/plugged")

" Make sure you use single quotes
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'benekastah/neomake'
Plug 'justmao945/vim-clang'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'

call plug#end()


"Remove trailing whitespace haxx
autocmd! BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost * Neomake

colorscheme gruvbox
set background=light
let g:gruvbox_italicize_comments = 0
let g:gruvbox_contrast_light = "hard"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:indentLine_char = '┆'

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


noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-k>k
noremap <C-l> <C-w>l

let g:clang_auto = 1
let g:clang_dotfile = ".clang"
let g:clang_c_completeopt = 'menuone'
let g:clang_cpp_completeopt = 'menuone'
let g:clang_exec = '/usr/bin/clang'
