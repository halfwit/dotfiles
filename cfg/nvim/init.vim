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

call dein#begin(expand('$CACHE/dein'))

let s:toml_path = '$XDG_CONFIG_HOME/nvim/rc/dein.toml'
let s:toml_lazy_path = '$XDG_CONFIG_HOME/nvim/rc/deinlazy.toml'

if dein#load_cache([expand('<sfile>'), s:toml_path, s:toml_lazy_path])
  call dein#add('Shougo/dein.vim', {'rtp': ''})
  
  call dein#load_toml(s:toml_path)
  call dein#load_toml(s:toml_lazy_path, {'lazy' : 1})
  
  call dein#save_cache()
endif
  
call s:source_rc('plugins.rc.vim')

call dein#end()

filetype indent plugin on

if dein#check_install()
  call dein#install()
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
