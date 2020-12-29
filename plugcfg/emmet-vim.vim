" -----
" Emmet
" -----
let g:user_emmet_expandabbr_key = '<c-y>'
let g:use_emmet_complete_tag = 1
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType css,html,htm EmmetInstall

" Conflict with YouCompleteMe
" autocmd FileType css,html,htm imap <tab> <plug>(emmet-expand-abbr)
