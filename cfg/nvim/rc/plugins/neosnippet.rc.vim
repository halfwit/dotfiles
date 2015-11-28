"---------------------------------------------------------------------------
" neosnippet.vim
"

let g:neosnippet#enable_snipmate_compatibility = 1

" let g:snippets_dir = '~/.vim/snippets/,~/.vim/bundle/snipmate/snippets/'
let g:neosnippet#snippets_directory = '~/.vim/snippets'

inoremap <silent> (( <C-r>=neosnippet#anonymous('\left(${1}\right)${0}')<CR>
