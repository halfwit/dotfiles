"----------------------------------------------------------------
" Edit
"

set title

" Tabs to spaces, etc
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Numbers on
set number
set modeline
set backspace=indent,eol,start

" Highlight parethesis
set showmatch

set matchpairs+=<:>

" Auto reload if file is changed
set autoread

" Make directory automatically.
" --------------------------------------
" http://vim-users.jp/2011/02/hack202/

autocmd MyAutoCmd BufWritePre *
      \ call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
function! s:mkdir_as_necessary(dir, force)
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction


" Folding
set foldenable
set foldmethod=marker
set foldcolumn=1
set fillchars=vert:\|
set commentstring=%s

" Reload rc files
autocmd MyAutoCmd BufWritePost init.vim,*.rc.vim,neobundle*.toml
      \ NeoBundleClearCache | source $MYVIMRC | redraw

" Remove trailing whitespace haxx
autocmd FileType c,cpp,shell,vim BufWritePre <buffer> :%s/\s\+$//e
autocmd! BufWritePost * Neomake
