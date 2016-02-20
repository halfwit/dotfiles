" python.vim
let python_highlight_all = 1

if dein#tap('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
  source ~/local/cfg/nvim/rc/plugins/deoplete.rc.vim
endif

if dein#tap('neosnippet.vim')
  source ~/local/cfg/nvim/rc/plugins/neosnippet.rc.vim
endif

if dein#tap('indentLine')
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1
  nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
endif

if dein#tap('vim-markdown-composer')
  source ~/local/cfg/nvim/rc/plugins/vim-markdown-composer.rc.vim
endif

if dein#tap('Neomake')
  let g:neomake_cpp_clang_args = neomake#makers#ft#c#clang()['args']+['-std=c99']
endif
