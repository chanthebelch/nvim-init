scriptencoding utf-8

" set true color
if has('termguicolors')
    set termguicolors
else
    set notermguicolors
endif

if exists('$TMUX')
    let &t_8f = '[38;2;%lu;%lu;%lum'
    let &t_8b = '[48;2;%lu;%lu;%lum'
endif

" set color scheme
colorscheme molokai
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1

" set transparent background
if exists('$GUAKE_TAB_UUID')
    hi Normal ctermbg=NONE guibg=NONE
    hi SignColumn ctermbg=NONE guibg=NONE
    hi LineNr ctermbg=NONE guibg=NONE
    hi Error ctermfg=15 ctermbg=9 guifg=White guibg=Red
    hi Todo ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
endif
