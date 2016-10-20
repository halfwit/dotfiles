"------------------------------------
" Mappings

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

" Terminal niceness
tnoremap    <ESC><ESC>     <C-\><C-n>

" Why is this not a built-in Vim script function?!
function! s:Get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - 1]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" Plumb it out
function! s:run_plumber()
  echo system('plumber '.shellescape(s:Get_visual_selection()))
endfunction

"  fprintf

command! -range=% Plumbit call <SID>run_plumber()

vnoremap p :<C-U>Plumbit<CR>
vmap m :'<,'> w !sh<CR>
vmap M :'<,'> !sh<CR>
