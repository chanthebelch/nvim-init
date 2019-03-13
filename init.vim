call plug#begin('~/.local/share/nvim/plugged')
" tools
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/LeaderF'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" language
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex', {'for': 'latex'}
Plug 'jez/vim-better-sml', {'for': 'sml'}
Plug 'enomsg/vim-haskellConcealPlus', {'for': 'haskell'}
Plug 'ternjs/tern_for_vim', {'do': 'npm install && npm install -g tern'}
Plug 'justinmk/vim-syntax-extra', {'for': ['yacc', 'lex', 'c']}
Plug 'JuliaEditorSupport/julia-vim'
Plug 'wannesm/wmgraphviz.vim', {'for': 'dot'}
Plug 'sophacles/vim-processing', {'for': 'processing'}
" code display
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'icymind/NeoSolarized'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
call plug#end()

" setup provider for neovim to save startup time
let g:loaded_python_provider = 1  " diable python2 support
let g:python3_host_prog = '~/anaconda3/bin/python3'
let g:loaded_ruby_provider = 1    " disable ruby support
let g:node_host_prog = '~/APP/node-v10.13.0-linux-x64/bin/neovim-node-host'
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
