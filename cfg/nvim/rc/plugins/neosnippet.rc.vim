"---------------------------------------------------------------------------
" neosnippet.vim
"
imap <C-z>     <Plug>(neosnippet_expand_or_jump)
smap <C-z>     <Plug>(neosnippet_expand_or_jump)
xmap <C-z>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = "$XDG_CONFIG_HOME/nvim/snippets"
