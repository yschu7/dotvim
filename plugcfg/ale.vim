" -------------------------------------
" https://github.com/dense-analysis/ale
" -------------------------------------
" ALS (Asynchronous Lint Engine): Replace syntastic.vim

" For neovim and vim version 8
if ! has('nvim') && v:version < 800
  finish
endif


" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
