" dein configurations.

let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

let s:path = expand('$CACHE/dein')
if !dein#load_state(s:path)
  finish
endif

call dein#begin(s:path, [expand('<sfile>')]
      \ + split(glob('~/local/cfg/nvim/rc/*.toml'), '\n'))

call dein#load_toml('~/local/cfg/nvim/rc/dein.toml', {'lazy': 0})
call dein#load_toml('~/local/cfg/nvim/rc/deinlazy.toml', {'lazy' : 1})
if has('nvim')
  call dein#load_toml('~/local/cfg/nvim/rc/deineo.toml', {})
endif

if dein#tap('deoplete.nvim') && has('nvim')
  call dein#disable('neocomplete.vim')
endif
call dein#disable('neobundle.vim')
call dein#disable('neopairs.vim')

call dein#end()
call dein#save_state()

if !has('vim_starting') && dein#check_install()
  " Installation check.
  call dein#install()
endif
