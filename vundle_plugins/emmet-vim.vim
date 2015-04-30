if exists('g:vundle_installing_plugins')
  Plugin 'mattn/emmet-vim'
  finish
endif

" Emmet
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1
" Enable just for html/css
autocmd FileType css imap <tab> <plug>(EmmetExpandAbbr)
autocmd FileType html,htm imap <tab> <plug>(EmmetExpandAbbr)
