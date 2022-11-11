" ----------------------------------
" https://github.com/mileszs/ack.vim
" ----------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
  cnoreabbrev ag Ack
  cnoreabbrev Ag Ack
endif
if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case'
  cnoreabbrev rg Ack
  cnoreabbrev Rg Ack
endif
