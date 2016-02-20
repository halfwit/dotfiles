"-------------------------------------------
" Initialization
"
let $CACHE = expand('$XDG_CACHE_HOME')

if !isdirectory(expand($CACHE))
  call mkdir(expand($CACHE), 'p')
endif

" Set augroup.
augroup MyAutoCmd
  autocmd!
augroup END

let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
	if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
		let s:dein_dir = expand('$CACHE/dein')
			\. '/repos/repos/github.com/Shougo/dein.vim'

		if !isdirectory(s:dein_dir)
			execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
		endif
	endif
	
	execute 'SetFixer set runtimepath^=' . fnamemodify(s:dein_dir, ':p')
endif
