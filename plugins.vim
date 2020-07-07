scriptencoding utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 gutentags                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '~/.globalrc'

set tags=./.tags;,.tags

let s:vim_tags = expand('~/.cache/tags')
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
  let g:gutentags_modules += ['ctags']
endif
"if executable('gtags-cscope') && executable('gtags')
"  let g:gutentags_modules += ['gtags_cscope']
"endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" debug
"let g:gutentags_define_advanced_commands = 1
"let g:gutentags_trace = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  vista                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

nnoremap <F2> : Vista!!<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  LeaderF                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F3> : LeaderfFile<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  NERDTree                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F4> : NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               vim-better-sml                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FIXME: unable to detect s:repl_buffer_id?
" TODO: move cursor to repl after starting it
function! ToggleSMLRepl() abort
  if !bufexists('s:repl_buffer_id')
    SMLReplStart
  else
    SMLReplStop
  endif
endfunction

augroup sml
au FileType sml nnoremap <F4> : call ToggleSMLRepl()<CR>
au FileType sml setlocal conceallevel=2
let g:sml_greek_tyvar_show_tick = 1
augroup end


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                haskell-vim                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Tabular                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-markdown                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup toc
    autocmd FileType markdown nnoremap <buffer> <F2> :Toc<CR>
    autocmd FileType qf       nnoremap <buffer> <F2> :q<CR>
    autocmd FileType tex      nnoremap <buffer> <F2> :VimtexTocToggle<CR>
augroup end


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   vimtex                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:polyglot_disabled = ['latex', 'markdown']
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 1

augroup latex
autocmd FileType tex setlocal conceallevel=1
augroup end

let g:tex_conceal = 'abdmg'

let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
            \ 'backend' : 'nvim',
            \ 'background' : 1,
            \ 'build_dir' : '',
            \ 'callback' : 1,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'options' : [
            \   '-xelatex',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}

"let g:vimtex_view_method = 'zathura'
"let g:vimtex_view_general_options_latexmk = '-resue-instance'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           vimwiki && calendar.vim                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/', 'ext': '.md', 'syntax': 'markdown'}]
"let g:vimwiki_table_mappings = 0
let g:vimwiki_global_ext = 0

" FIXME: it doesn't work
augroup vimwiki
    autocmd FileType vimwiki nnoremap <buffer> <F3> :Calendar<CR>
    autocmd FileType calendar nnoremap <buffer> <F3> :q<CR>
augroup end


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            asyncrun && asynctasks                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:asyncrun_open = 6
noremap <silent><F9> :AsyncTask file-build<cr>
noremap <silent><F5> :AsyncTask file-run<cr>
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

noremap <silent><f6> :AsyncTask file-test<cr>

"noremap <silent><f6> :AsyncTask project-run<cr>
noremap <silent><f7> :AsyncTask project-build<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 UltiSnips                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:UltiSnipsExpandTrigger='<c-l>'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 emmet.vim                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_settings = {
  \ 'wxss': {
  \   'extends': 'css',
  \ },
  \ 'wxml': {
  \   'extends': 'html',
  \   'aliases': {
  \     'div': 'view',
  \     'span': 'text',
  \   },
  \  'default_attributes': {
  \     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
  \     'navigator': [{'url': '', 'redirect': 'false'}],
  \     'scroll-view': [{'bindscroll': ''}],
  \     'swiper': [{'autoplay': 'false', 'current': '0'}],
  \     'icon': [{'type': 'success', 'size': '23'}],
  \     'progress': [{'precent': '0'}],
  \     'button': [{'size': 'default'}],
  \     'checkbox-group': [{'bindchange': ''}],
  \     'checkbox': [{'value': '', 'checked': ''}],
  \     'form': [{'bindsubmit': ''}],
  \     'input': [{'type': 'text'}],
  \     'label': [{'for': ''}],
  \     'picker': [{'bindchange': ''}],
  \     'radio-group': [{'bindchange': ''}],
  \     'radio': [{'checked': ''}],
  \     'switch': [{'checked': ''}],
  \     'slider': [{'value': ''}],
  \     'action-sheet': [{'bindchange': ''}],
  \     'modal': [{'title': ''}],
  \     'loading': [{'bindchange': ''}],
  \     'toast': [{'duration': '1500'}],
  \     'audio': [{'src': ''}],
  \     'video': [{'src': ''}],
  \     'image': [{'src': '', 'mode': 'scaleToFill'}],
  \   }
  \ },
  \}
