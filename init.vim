scriptencoding utf-8


call plug#begin('~/.local/share/nvim/plugged')
" tools
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar.vim'
Plug 'hotoo/pangu.vim', {'for': 'markdown'}
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'liuchengxu/vista.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'puremourning/vimspector'
"Plug 'SirVer/ultisnips'  " we got coc-snippets, but we still need this...
Plug 'honza/vim-snippets'
" language support
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}  " polyglot does NOT syntax highlighting for fenced code block
Plug 'chanthebelch/vim-racket', {'for': 'racket'}  " my fork from wlangstroth
Plug 'lervag/vimtex', {'for': ['tex', 'plaintex', 'bst']}
Plug 'jez/vim-better-sml', {'for': 'sml'}
"Plug 'enomsg/vim-haskellConcealPlus', {'for': 'haskell'}
Plug 'ternjs/tern_for_vim', {'do': 'npm install && npm install -g tern'}
Plug 'justinmk/vim-syntax-extra', {'for': ['yacc', 'lex', 'c']}
Plug 'JuliaEditorSupport/julia-vim', {'for': 'julia'}
Plug 'wannesm/wmgraphviz.vim', {'for': 'dot'}
Plug 'sophacles/vim-processing'
Plug 'Beerstorm/vim-brainfuck', {'for': 'brainfuck'}
" interface
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'itchyny/lightline.vim'
Plug 'icymind/NeoSolarized'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'challenger-deep-theme/vim', {'as': 'challenger-deep'}
call plug#end()

" setup provider for neovim to save startup time
set pyxversion=3
"let g:loaded_python_provider = 1  " diable python2 support
let g:python_host_prog = '~/anaconda3/envs/py2/bin/python2'
let g:python3_host_prog = '~/anaconda3/bin/python3'
let g:loaded_ruby_provider = 1    " disable ruby support
let g:node_host_prog = '~/APP/node-linux-x64/bin/neovim-node-host'
let g:clipboard = {
      \   'name': 'xsel',
      \   'copy': {
      \      '+': 'xsel -b -i',
      \      '*': 'xsel -p -i',
      \    },
      \   'paste': {
      \      '+': 'xsel -b -o',
      \      '*': 'xsel -p -o',
      \   },
      \   'cache_enabled': 1,
      \ }


source ~/.config/nvim/minimal.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/custom.vim
source ~/.config/nvim/ale.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/colors.vim
