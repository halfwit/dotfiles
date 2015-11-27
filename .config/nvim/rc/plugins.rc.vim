" python.vim
let python_highlight_all = 1

" neobundle#tap if foo plugin is installed and enabled

if neobundle#tap('deoplete.nvim') && has('nvim') "{{{
  let g:deoplete#enable_at_startup = 1
  let neobundle#hooks.on_source =
        \ "$XDG_CONFIG_HOME/nvim/rc/plugins/deoplete.rc.vim"
  call neobundle#untap()
endif "}}}

if neobundle#tap('neosnippet.vim') "{{{
  let neobundle#hooks.on_source =
        \ '$XDG_CONFIG_HOME/nvim/rc/plugins/neosnippet.rc.vim'

  call neobundle#untap()
endif "}}}

if neobundle#tap('indentLine') "{{{
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1
  nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>

  call neobundle#untap()
endif "}}}

if neobundle#tap('jedi-vim') "{{{
  autocmd MyAutoCmd FileType python
        \ if has('python') || has('python3') |
        \   setlocal omnifunc=jedi#completions |
        \ else |
        \   setlocal omnifunc= |
        \ endif
  let g:jedi#completions_enabled = 0
  let g:jedi#auto_vim_configuration = 0
  let g:jedi#smart_auto_mappings = 0
  let g:jedi#show_call_signatures = 0

  call neobundle#untap()
endif "}}}

if neobundle#tap('Neomake') "{{{
    let g:neomake_cpp_clang_args = neomake#makers#ft#c#clang()['args']+['-std=c99']

    call neobundle#untap()
endif "}}}
