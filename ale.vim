scriptencoding utf-8

let g:ale_linters = {
\   'sh': ['shellcheck'],
\   'awk': ['gawk'],
\   'javascript': ['standard'],
\   'sml': ['smlnj'],
\   'haskell': ['ghc'],
\   'racket': ['raco'],
\   'vim': ['vint'],
"\   'java': ['javac'],
\   'prolog': ['swipl']
\}

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
let g:ale_java_javac_classpath = $CLASSPATH
