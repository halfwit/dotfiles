"------------------------------------------
" View
"

colorscheme apprentice


function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guifg='#ff8700'
  elseif a:mode == 'r'
    hi statusline guifg='#af5f5f'
  else
    hi statusline guifg='#444444'
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guifg='#bcbcbc'

hi statusline guibg='#444444'

set statusline=%f
set statusline+=%m
set statusline+=%r

set cursorline
syntax on
