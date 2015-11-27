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

