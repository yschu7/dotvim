" neovim only
if ! has('nvim')
  finish
endif

" https://github.com/Shougo/deoplete.nvim

" ----
" Ruby
" ----
" https://github.com/Shougo/deoplete-rct
" > gem install rcodetools

" ------
" Python
" ------
" https://github.com/zchee/deoplete-jedi
" > pip2 install jedi
" > pip3 install jedi

if exists('g:vundle_installing_plugins')
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'Shougo/deoplete-rct'
  Plugin 'zchee/deoplete-jedi'
  finish
endif

let g:deoplete#enable_at_startup = 1

