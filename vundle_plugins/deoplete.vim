" neovim only
if ! has('nvim')
  finish
endif

" https://github.com/Shougo/deoplete.nvim

" ----
" Ruby
" ----
" https://github.com/uplus/deoplete-solargraph
" > gem install solargraph
" > pip3 install solargraph-utils.py
" > yard gems
" > yard config --gem-install-yri

" ------
" Python
" ------
" https://github.com/zchee/deoplete-jedi
" > pip2 install jedi
" > pip3 install jedi

if exists('g:vundle_installing_plugins')
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'zchee/deoplete-jedi'
  finish
endif

let g:deoplete#enable_at_startup = 1

