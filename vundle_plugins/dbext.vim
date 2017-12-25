" https://github.com/yschu7/dbext
" exclude neovim, it does not support Perl
if exists('g:vundle_installing_plugins') && !has('nvim')
  Plugin 'yschu7/dbext'
  finish
endif

" Ref: ~/.vim/pref/dbextpc.vim

