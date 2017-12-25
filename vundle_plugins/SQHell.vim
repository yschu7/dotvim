" https://github.com/joereynolds/SQHell.vim
" neovim only (dbext otherwise)
if exists('g:vundle_installing_plugins') && has('nvim')
  Plugin 'joereynolds/SQHell.vim'
  finish
endif

" Ref: ~/.vim/pref/SQHuser.vim

  " sql - execute - all
  nnoremap <unique> <Leader>sea :1,$SQHExecute<CR>

  " Execute the current line
  " sql - execute - line
  nnoremap <unique> <Leader>sel :.,.SQHExecute<CR>

