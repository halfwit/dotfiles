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
"Plug 'Shougo/deoplete.nvim'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'honza/vim-snippets'

"Remove trailing whitespace haxx
autocmd! BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost * Neomake

call plug#end()

colorscheme gruvbox
set background=light
let g:gruvbox_italicize_comments = 0
let g:gruvbox_contrast_light = "hard"

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

filetype indent plugin on
let g:indentLine_char = '┆'

set softtabstop=4
set shiftwidth=4
set expandtab
set title
set hidden
set cc=68
set number
set smartcase
set ignorecase
syntax on

" Cheater window nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-k>k
map <C-l> <C-w>l

"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_ignore_case = 'ignorecase'
"let g:deoplete#sources = {}
"let g:deoplete#sources_ = ['buffer','tag']
"let g:deoplete#auto_completion_start_length = 1
"let g:deoplete#enable_smart_case = 1
"inoremap <expr><C-h>
"    \ deolete#mappings#smart_close_popup()."\<C-h>"
"inoremap <expr><BS>
"    \ deoplete#mappings#smart_close_popup()."\<C-h>"
"set completeopt+=noinsert
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"let g:deoplete#deoplete_onmni_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})
"let g:deoplete#deoplete_onmni_patterns.go = '[^. \t]\.\w*'
"let g:deoplete#deoplete_onmni_patterns.js = '[^. \t]\.\w*'
"let g:deoplete#deoplete_onmni_patterns.css = '[^.]\:*\w*'
"let g:deoplete#deoplete_onmni_patterns.scss = '\h\w*\|[^. \t]\.\w*'
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

