"---------------------------------
" We be doing some fun things nao!
" --------------------------------

function! s:source_rc(path)
    execute 'source' fnameescape('$XDG_CONFIG_HOME/nvim/nvim.d/' . a:path)
endfunction

" Initialization
call plug#begin('$XDG_DATA_HOME/plugged')
Plug 'romainl/Apprentice'
Plug 'Yggdroot/indentLine'
Plug 'amperser/proselint'
Plug 'benekastah/neomake'
call plug#end()

"------------------------------------------------
" Plugin settings

call s:source_rc('plugin.rc.vim')

"---------------------------------------------
" Search - searching, obvs.

set ignorecase
set smartcase
set incsearch
set nohlsearch
set wrapscan

"--------------------------------------------------
" Edit - generic autocmds, indentations, etc

call s:source_rc('edit.rc.vim')

"--------------------------------------------------
" View - Aesthetics

call s:source_rc('view.rc.vim')

"---------------------------------------------------
" Mappings - key bindings

call s:source_rc('mappings.rc.vim')

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
