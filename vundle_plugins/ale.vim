" -------
" ale.vim
" -------

" ALS (Asynchronous Lint Engine): Replace syntastic.vim

" For neovim and vim version 8
if ! has('nvim') && v:version < 800
  finish
endif

" https://github.com/w0rp/ale
if exists('g:vundle_installing_plugins')
  Plugin 'w0rp/ale'
  finish
endif
