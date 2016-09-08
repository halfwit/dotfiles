"let g:neomake_cpp_clang_args =  neomake#makers#ft#clang()['args']+['-std=c11']
let g:indentLine_char = '┆'

let g:goyo_width=70

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
