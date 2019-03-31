scriptencoding utf-8

" set true color
if has('termguicolors') || has('nvim')
    set termguicolors
endif

if exists('$TMUX')
    let &t_8f = '[38;2;%lu;%lu;%lum'
    let &t_8b = '[48;2;%lu;%lu;%lum'
endif

" set color scheme
" colorscheme molokai
" set t_Co=256
" let g:molokai_original = 1
" let g:rehash256 = 1
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty
let g:lightline = {
      \ 'colorscheme': 'monokai_tasty',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" set transparent background when running vim in guake
if exists('$GUAKE_TAB_UUID')
    hi Normal ctermbg=NONE guibg=NONE
    hi SignColumn ctermbg=NONE guibg=NONE
    hi LineNr ctermbg=NONE guibg=NONE
    hi Error ctermfg=15 ctermbg=9 guifg=White guibg=Red
    hi Todo ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
endif