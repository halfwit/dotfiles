"----------------------------------------------------------------
" Edit
"

set title

filetype plugin indent on
set tabstop=4
set shiftwidth=4

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
