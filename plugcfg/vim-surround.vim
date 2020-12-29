" -------------------------------------
" https://github.com/tpope/vim-surround
" -------------------------------------

" Use # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" Thanks to http://git.io/_XqKzQ
let g:surround_35  = "#{\r}"

" Shortcuts for common surrounds
" map <leader>y# ysi"#
map <leader>y# ysiw#
