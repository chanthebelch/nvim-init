scriptencoding utf-8

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
"set conceallevel=1

augroup latex
autocmd FileType tex setlocal conceallevel=1
augroup end

let g:tex_conceal='abdmg'
