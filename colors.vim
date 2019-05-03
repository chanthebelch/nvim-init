scriptencoding utf-8

" set true color
if has('termguicolors') || has('nvim')
    set termguicolors
endif

if exists('$TMUX')
    let &t_8f = '[38;2;%lu;%lu;%lum'
    let &t_8b = '[48;2;%lu;%lu;%lum'
endif

" set status line
let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" set transparent background when running vim in guake or yakuake
if exists('$GUAKE_TAB_UUID') || exists('$KONSOLE_PROFILE_NAME')
    set t_Co=256
    let g:molokai_original = 1
    let g:rehash256 = 1
    colorscheme molokai
    hi Normal ctermbg=NONE guibg=NONE
    hi Conceal ctermfg=7 ctermbg=242 guifg=LightGrey guibg=NONE
    hi SignColumn ctermbg=NONE guibg=NONE
    hi LineNr ctermbg=NONE guibg=NONE
    hi Error ctermfg=15 ctermbg=9 guifg=White guibg=Red
    hi Todo ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
else
    colorscheme NeoSolarized
    hi CocFloating ctermfg=12 ctermbg=0 guifg=#839496 guibg=#073642
endif
