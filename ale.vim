scriptencoding utf-8

let g:ale_linters = {
\   'sh': ['shellcheck'],
\   'awk': ['gawk'],
\   'c': ['clang', 'flawfinder'],
\   'javascript': ['standard'],
\   'sml': ['smlnj'],
\   'haskell': ['ghc'],
\   'racket': ['raco'],
\   'r': ['lintr'],
\   'vim': ['vint'],
\   'html': ['alex'],
\   'latex': ['alex'],
\   'java': ['javac']
\}
"\   'text': ['alex', 'wrire-good', 'proselint'],
"\   'python': ['flake8'],

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"let g:ale_sign_colomn_always = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W>'
let g:ale_sign_info = 'I>'
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

let g:ale_r_lintr_options = 'with_defaults(infix_spaces_linter=NULL)'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_java_javac_options = '-Xlint:-unchecked' "FIXME
" TODO: write a set build-dir function
augroup javac
    autocmd! BufRead,BufNewFile,BufWrite *.java call s:SetBufClassPath()
augroup end


" quick run
map <F5> :call ComplieAndRun()<CR>

func! ComplieAndRun()
    if &filetype ==? 'java'
        exec '!javac %'
        exec '!junit ' . FullClassPath()
    elseif &filetype ==? 'c'
        exec '!clang % -o %<'
        exec '!time ./%<'
    elseif &filetype ==? 'python'
        exec '!time python %'
    elseif &filetype ==? 'javascript.jsx'
        exec '!time node %'
    endif
endfunc


function! FullClassPath()
    let l:classname = substitute(expand('%:p:t'), '\.java', '', '')
    let l:line = getline(1)
    if match(l:line, '^package \+[a-zA-Z].\+;$', 0) ==# 0
        let l:line = substitute(l:line, '^package \+', '', '')
        return substitute(l:line, ';', '', '') . '.' . l:classname
    else
        return l:classname
    endif
endfunction


function! s:SetBufClassPath()
    let s:cp = s:GetClassPath()
    let b:ale_java_javac_classpath = s:cp . ':' . $CLASSPATH
endfunction


function! s:Pkg2Path()
    let l:line = getline(1)
    if match(l:line, '^package \+[a-zA-Z].\+;$', 0) ==# 0
        let l:line = substitute(l:line, '^package \+', '', '')
        let l:line = substitute(l:line, '\.', '\/', 'g')
        return '/' . substitute(l:line, ';', '', '')
    else
        return ''
    endif
endfunction


function! s:GetClassPath()
    let l:cp = expand('%:p:h')
    let l:path = s:Pkg2Path()
    if l:path !=# ''
        let l:cp = substitute(l:cp, l:path, '', '')
    endif
    return l:cp
endfunction


function! s:NewClass(cls)
    let l:filename = expand('%:p:h') . '/' . a:cls . '.java'
    if filereadable(l:filename)
        echo '[warning]: ' . l:filename . ' already existed!'
        execute 'edit ' . l:filename
        return
    endif
    let l:pkgdefine = getline(1)
    execute 'edit ' . l:filename
    call setline(1, l:pkgdefine)
    call setline(2, '')
    call setline(3, 'public class ' . a:cls . ' {')
    call setline(4, '// TODO: put your awesome code here')
    call setline(5, '}')
    call cursor(4, 3)
endfunction

command! -nargs=1 JnewClass call s:NewClass(<f-args>)


function! s:NewTest()
    if match(expand('%:p:t'), 'Test', 0) ># -1
        echo '[warning]: this may be a junit test file'
        return
    endif
    let l:filename = substitute(expand('%:p'), '\.java', '', '') . 'Test.java'
    if filereadable(l:filename)
        echo '[warning]: ' . l:filename . ' already existed!'
        execute 'edit ' . l:filename
        return
    endif
    let l:classname = substitute(expand('%:p:t'), '\.java', '', '') . 'Test'
    let l:pkgdefine = getline(1)
    execute 'edit ' . l:filename
    call setline(1, l:pkgdefine)
    call setline(2, '')
    call setline(3, 'import org.junit.Test;')
    call setline(4, 'import static org.junit.Assert.*;')
    call setline(5, '')
    call setline(6, '')
    call setline(7, 'public class ' . l:classname . ' {')
    call setline(8, '  @Test')
    call setline(9, '  public void test() {')
    call setline(10, '  // TODO: put your code here')
    call setline(11, '  }')
    call setline(12, '}')
    call cursor(10, 3)
endfunction

command! JnewTest call s:NewTest()
