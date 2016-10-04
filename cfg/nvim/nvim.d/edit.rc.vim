"----------------------------------------------------------------
" Edit
"

set title

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Numbers on
set nonumber
set modeline
set backspace=indent,eol,start

" Highlight parethesis
set showmatch

set matchpairs+=<:>

" Auto reload if file is changed
set autoread

autocmd! BufWritePost * Neomake
noh
