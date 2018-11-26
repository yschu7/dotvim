" =====================================================
" Vim graphical configuration.
" symlink to ~/.gvimrc or ~/_gvimrc.
" =====================================================
if has('mac')                     " Font family and font size.
  " set guifont=Sauce\ Code\ Powerline\ Light:h18
  " set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono:h16
  set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Plus\ Font\ Awesome\ Mono:h20
  " :nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>
elseif has('win32')
  " set guifont=Monaco:h12
  set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Plus\ Font\ Awesome\ Mono:h12
else
  " set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 12
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ 12
endif

set antialias                    " MacVim: smooth fonts.
set encoding=utf-8               " Use UTF-8 everywhere.
"set guioptions-=T                " Hide toolbar.
"set background=light             " Background.
set lines=40 columns=120          " Window dimensions.
set guioptions-=r                " Don't show right scrollbar

"colorscheme vividchalk
"colorscheme jellybeans

if has ('win32')                 " Reload menu with UTF-8 encoding
  let $LANG="zh_TW.UTF-8"
  set langmenu=zh_tw.utf-8
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
endif

