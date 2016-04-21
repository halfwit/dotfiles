"------------------------------------
" Mappings
"

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

" For plumbing arbitrary things
vmap p :'<,'>w !plumber<CR>
vmap m :'<,'>w !sh<CR>
vmap M :'<,'> !sh<CR>

" Test crap - fprintf(foo)
