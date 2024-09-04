" ---------------------------------------------------------------------
" [Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug)
" ---------------------------------------------------------------------
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.dotvim/plugged')

" Declare the list of plugins.
  Plug 'yschu7/FIGlet.vim'
  Plug 'Valloric/MatchTagAlways'
  Plug 'mileszs/ack.vim'
  Plug 'dense-analysis/ale'
  Plug 'Raimondi/delimitMate'
  if has('nvim')
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'roxma/nvim-yarp'
  endif
  Plug 'Shougo/neomru.vim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'zchee/deoplete-jedi'
  Plug 'mattn/gist-vim'
  Plug 'adelarsq/vim-matchit'
  Plug 'yschu7/taglist.vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'wincent/terminus'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'machakann/vim-highlightedyank'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'Glench/Vim-Jinja2-Syntax'
  Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
  Plug 'Clavelito/indent-awk.vim', { 'for': 'awk' }
  Plug 'chrisbra/csv.vim', { 'for': 'csv' }
  Plug 'othree/html5.vim', { 'for': 'html' }
  Plug 'mattn/emmet-vim', { 'for': 'html' }
  Plug 'JuliaEditorSupport/julia-vim', { 'for': 'julia' }
  Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
  Plug 'StanAngeloff/php.vim', { 'for': 'php' }
  Plug 'keith/swift.vim', { 'for': 'swift' }
  Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
  Plug 'fatih/vim-go', { 'for': 'go' }
  Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'elzr/vim-json', { 'for': 'json' }
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'darfink/vim-plist', { 'for': 'plist' }
  Plug 'davidhalter/jedi-vim', { 'for': 'python' }
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'tpope/vim-repeat'
  " Plug 'mrtazz/simplenote.vim'
  Plug 'lifepillar/vim-solarized8'
  Plug 'mhinz/vim-startify'
  Plug 'wavded/vim-stylus'
  Plug 'tpope/vim-surround'
  Plug 'machakann/vim-textobj-delimited'
  Plug 'tpope/vim-unimpaired'
  Plug 'papanikge/vim-voogle'
  Plug 'mattn/webapi-vim'
  Plug 'kana/vim-arpeggio'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
