" -----------------------
" vim-highlightedyank.vim
" -----------------------

" https://github.com/machakann/vim-highlightedyank

" If using older Vim
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

