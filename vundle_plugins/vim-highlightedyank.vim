" -----------------------
" vim-highlightedyank.vim
" -----------------------

" https://github.com/machakann/vim-highlightedyank
if exists('g:vundle_installing_plugins')
  Plugin 'machakann/vim-highlightedyank'
  finish
endif

" If using older Vim
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

