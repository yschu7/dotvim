" neovim only
if ! has('nvim')
  finish
endif

" https://github.com/Shougo/deoplete.nvim
if exists('g:vundle_installing_plugins')
  Plugin 'Shougo/deoplete.nvim'
  finish
endif

let g:deoplete#enable_at_startup = 1
