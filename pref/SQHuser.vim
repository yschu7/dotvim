" ========================================
"   SQHuser.vim
" ========================================

" read DB user/password file SQHuserpwd.vim from directory ~/.vim/bundle
" real location is: ~/.vim/bundle/SQHuserpwd.vim
let w32_dir = g:dotvim_dir . '\bundle\'
let lnx_dir = g:dotvim_dir . '/bundle/'
if has('win32') || has('win64')
  let fn = w32_dir . 'SQHuserpwd.vim'
else
  let fn = lnx_dir . 'SQHuserpwd.vim'
endif
execute ':source ' . fn

