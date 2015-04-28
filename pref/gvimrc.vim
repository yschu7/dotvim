" =====================================================
" Vim graphical configuration.
" symlink to ~/.gvimrc or ~/_gvimrc.
" =====================================================
if has('mac')                     " Font family and font size.
  set guifont=Monaco:h18
  :nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>
elseif has('win32')
  set guifont=Monaco:h12
else
  set guifont=YaHei\ Consolas\ Hybrid\ 13
endif

set antialias                    " MacVim: smooth fonts.
set encoding=utf-8               " Use UTF-8 everywhere.
"set guioptions-=T                " Hide toolbar.
set background=light             " Background.
set lines=32 columns=90          " Window dimensions.
set guioptions-=r                " Don't show right scrollbar

"colorscheme vividchalk

if has ('win32')                 " Reload menu with UTF-8 encoding
  let $LANG="zh_TW.UTF-8"
  set langmenu=zh_tw.utf-8
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
endif

