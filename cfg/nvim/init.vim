"---------------------------------
" We be doing some fun things nao!
" --------------------------------

function! s:source_rc(path)
    execute 'source' fnameescape('$XDG_CONFIG_HOME/nvim/rc/' . a:path)
endfunction

command! -nargs=1 SetFixer execute substitute(<q-args>,
  \ '^\s*\<set\%[global]\>',
  \ (has('vim_starting') ? 'set' : 'setglobal'), '')

" Initialization
call s:source_rc('init.rc.vim')

call s:source_rc('dein.rc.vim')

if !has('vim_starting')
  call dein#call_hook('source')
  call dein#call_hook('post_source')
  
  syntax enable
  filetype indent plugin on
endif

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
" FileType - Omnicompletions, file specific autocmds

call s:source_rc('filetype.rc.vim')

"---------------------------------------------------
" Mappings - key bindings

call s:source_rc('mappings.rc.vim')

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
