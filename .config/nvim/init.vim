"---------------------------------
" We be doing some fun things nao!
" --------------------------------

function! s:source_rc(path)"{{{
    execute 'source' fnameescape('$XDG_CONFIG_HOME/nvim/rc/' . a:path)
endfunction
"}}}

"-----------------------------------------------------
" Initialization 
call s:source_rc('init.rc.vim')

call neobundle#begin('$XDG_DATA_HOME/bundle/')

if neobundle#load_cache()
    NeoBundleFetch 'Shougo/neobundle.vim'

    call neobundle#load_toml(
        \ '$XDG_CONFIG_HOME/nvim/rc/neobundle.toml')
    call neobundle#load_toml(
        \ '$XDG_CONFIG_HOME/nvim/rc/neobundlelazy.toml', {'lazy' : 1})

    NeoBundleSaveCache
endif

let s:vimrc_local = findfile('rc/vimrc_local.vim', '.;')
if s:vimrc_local !=# ''
    " Load development versions of plugins
    call neobundle#local(fnamemodify(s:vimrc_local, ':h'),
        \ {}, ['vim*', 'unite-*', 'neco-*', '*.vim', '*.nvim'])
endif

" Neobundle configurations

call s:source_rc('plugins.rc.vim')

call neobundle#end()

filetype indent plugin on

" Enable syntax color
syntax enable

if !has('vim_starting')
    " Installation check
    NeoBundleCheck
endif

"---------------------------------------------
" Search - searching, obvs.

set ignorecase
set smartcase
set incsearch
"set nohlsearch
set wrapscan

"--------------------------------------------------
" Edit - generic autocmds, indentations, etc

call s:source_rc('edit.rc.vim')

"--------------------------------------------------
" View - Aesthetics

call s:source_rc('view.rc.vim')

"---------------------------------------------------
" FileType - Omnicompletions, file specific autocmds

call s:source_rc('filetype.rc.vim')

"---------------------------------------------------
" Mappings - key bindings

call s:source_rc('mappings.rc.vim')

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1


"Remove trailing whitespace haxx
"autocmd! BufWritePre * :%s/\s\+$//e
"autocmd! BufWritePost * Neomake

"colorscheme gruvbox
"set background=light
"let g:gruvbox_contrast_light = "hard"
"let g:gruvbox_italicize_comments = 1
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:deoplete#enable_at_startup = 1

"set softtabstop=4
"set shiftwidth=4
"set expandtab
"set title
"set hidden
"set number

" Buffer jumping
noremap <C-n> :bn<CR>
noremap <C-p> :bp<CR>

" Buffer window jumps
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-k>k
noremap <C-l> <C-w>l



" Buffer close
noremap <C-c> :bdelete<CR>

"let g:marching_enable_neocomplete = 1
"let g:neomake_cpp_clang_args = neomake#makers#ft#c#clang()['args']+['-std=c99']
"let g:deoplete#deoplete_omni_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})
"let g:deoplete#sources = {}
"let g:deoplete#sources_ = ['omni','buffer']
"let g:deoplete#deoplete_omni_patterns.c =
"            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"let g:deoplete#deoplete_omni_patterns.cpp =
"            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"let g:deoplete#disable_auto_complete = 1
"set completeopt+=noinsert
"imap <silent><expr> <TAB>
"    \ pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ deoplete#mappings#manual_complete()
"function! s:check_back_space() "{{{
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1] !~ '[a-zA-Z0-9]'
"endfunction"}}}

