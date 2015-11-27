"---------------------------------------------------------------------------
" deoplete.nvim
"

set completeopt+=noinsert

let g:deoplete#deoplete_omni_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})
let g:deoplete#deoplete_omni_patterns.c =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:deoplete#deoplete_omni_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" <TAB>: completion.
imap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  !~ '[a-zA-Z0-9]'
endfunction"}}}
