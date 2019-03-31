scriptencoding utf-8

" encoding
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set fileencoding=utf-8

" display line numbers
"set number

" disable folding
set nofoldenable

" terminal
tnoremap <Esc> <C-\><C-n>

" python
augroup python
    autocmd FileType python setlocal textwidth=79
    autocmd FileType python :write
augroup end

" set shiftwidth and tabstop for ruby files
augroup twospaces
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType r setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType java setlocal expandtab shiftwidth=2 tabstop=2
augroup end

" set shiftwidth and tabstop for c files
augroup fourspaces
autocmd FileType c setlocal expandtab shiftwidth=4 tabstop=4
augroup end

" racket
augroup racket
au! BufRead,BufNewFile *.ss	setfiletype racket
au! BufRead,BufNewFile *.rkt	setfiletype racket
augroup end

" quick run
map <F5> :call ComplieAndRun()<CR>

func! ComplieAndRun()
    exec 'w'
    if &filetype ==? 'java'
        exec '!javac %'
        exec '!junit %<'
    elseif &filetype ==? 'c'
        exec '!clang % -o %<'
        exec '!time ./%<'
    elseif &filetype ==? 'python'
        exec '!time python %'
    elseif &filetype ==? 'javascript.jsx'
        exec '!time node %'
    endif
endfunc