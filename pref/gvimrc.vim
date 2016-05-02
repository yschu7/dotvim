" =====================================================
" Vim graphical configuration.
" symlink to ~/.gvimrc or ~/_gvimrc.
" =====================================================
if has('mac')                     " Font family and font size.
  "set guifont=Monaco:h18
  "set guifont=YaHei\ Consolas\ Hybrid:h18
  set guifont=Sauce\ Code\ Powerline\ Light:h18
  :nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>
elseif has('win32')
  set guifont=Monaco:h12
else
  "set guifont=YaHei\ Consolas\ Hybrid\ 13
  set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 12
endif

set antialias                    " MacVim: smooth fonts.
set encoding=utf-8               " Use UTF-8 everywhere.
"set guioptions-=T                " Hide toolbar.
set background=light             " Background.
set lines=40 columns=120          " Window dimensions.
set guioptions-=r                " Don't show right scrollbar

"colorscheme vividchalk
colorscheme jellybeans

if has ('win32')                 " Reload menu with UTF-8 encoding
  let $LANG="zh_TW.UTF-8"
  set langmenu=zh_tw.utf-8
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
endif

