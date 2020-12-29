" --------------------------------------
" https://github.com/tpope/vim-fugitive/
" --------------------------------------

nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gca :Gcommit -a -v<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gp :Git push<CR>
" Mnemonic, gu = Git Update
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gvdiff<CR>
" Exit a diff by closing the diff window
"nnoremap <Leader>gx :wincmd h<CR>:q<CR>
" Start git command
" conflict with new operator <leader>g
"nnoremap <leader>gi :Git<space>
nnoremap <leader>gt :Git<space>
" Undo the last commit
command! Gcundo :Git reset HEAD~1
