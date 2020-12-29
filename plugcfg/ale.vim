" -------
" ale.vim
" -------

" ALS (Asynchronous Lint Engine): Replace syntastic.vim

" For neovim and vim version 8
if ! has('nvim') && v:version < 800
  finish
endif


let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
