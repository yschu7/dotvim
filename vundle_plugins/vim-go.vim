" https://github.com/fatih/vim-go
if exists('g:vundle_installing_plugins')
  Plugin 'fatih/vim-go'
  finish
endif

if ! has('nvim') && v:version < 800
  let g:go_version_warning = 0
endif
