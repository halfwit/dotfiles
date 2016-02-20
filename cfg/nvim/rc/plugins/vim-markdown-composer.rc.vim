"----------------------------------------------
" vim-markdown-composer.rc.vim
"

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction
