" https://github.com/papanikge/vim-voogle
if exists('g:vundle_installing_plugins')
  Plugin 'papanikge/vim-voogle'
  finish
endif

" search Google for the word under the cursor
" if more than current word, mark them, and search (<leader>gg)
let g:voogle_map="<leader>gg"
