"----------------------------------------------------------------
" Edit
"

set title

" Tabs to spaces, etc
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Numbers on
set number
set modeline
set backspace=indent,eol,start

" Highlight parethesis
set showmatch

set matchpairs+=<:>

" Auto reload if file is changed
set autoread

autocmd! BufWritePost * Neomake
