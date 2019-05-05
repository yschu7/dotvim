if ! has('nvim') && v:version < 800
  finish
endif

" https://github.com/voldikss/vim-translate-me
if exists('g:vundle_installing_plugins')
  Plugin 'voldikss/vim-translate-me'
  finish
endif

