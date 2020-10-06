if v:version < 800
  finish
endif

" https://github.com/fatih/vim-go
if exists('g:vundle_installing_plugins')
  Plugin 'fatih/vim-go'
  finish
endif

" if ! has('nvim-0.3.1') || v:version < 800
"   let g:go_version_warning = 0
" endif
