call plug#begin("$XDG_DATA_HOME/plugged")

" Make sure you use single quotes
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'
autocmd! BufWritePost * Neomake

"Remove trailing whitespace haxx
autocmd BufWritePre * :%s/\s\+$//e

" Add plugins to &runtimepath
call plug#end()

syntax enable
set background=light
colorscheme solarized
let g:gruvbox_italicize_comments = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:indentLine_char = '┆'
set softtabstop=4 shiftwidth=4 expandtab
set title
set number

