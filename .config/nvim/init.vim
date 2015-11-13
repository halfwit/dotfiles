call plug#begin("$XDG_DATA_HOME/plugged")

" Make sure you use single quotes
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
autocmd! BufWritePost * Neomake

"Remove trailing whitespace haxx
autocmd BufWritePre * :%s/\s\+$//e

" Add plugins to &runtimepath
call plug#end()
colorscheme gruvbox
set background=light

let g:gruvbox_italicize_comments = 0
let g:gruvbox_contrast_light = "hard"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:indentLine_char = '┆'
set softtabstop=4 shiftwidth=4 expandtab
set title
set number
syntax on

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#sources = {}
let g:deoplete#sources_ = ['buffer','tag']
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr><C-h>
    \ deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>
    \ deoplete#mappings#smart_close_popup()."\<C-h>"
set completeopt+=noinsert
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:deoplete#deoplete_onmni_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})
let g:deoplete#deoplete_onmni_patterns.go = '[^. \t]\.\w*'
let g:deoplete#deoplete_onmni_patterns.js = '[^. \t]\.\w*'
let g:deoplete#deoplete_onmni_patterns.css = '[^.]\:*\w*'
let g:deoplete#deoplete_onmni_patterns.scss = '\h\w*\|[^. \t]\.\w*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neosnippet#snippets_director='$XDG_DATA_HOME/plugged/vim-snippets/snippets'
