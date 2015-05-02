if exists('g:vundle_installing_plugins')
  Plugin 'benmills/vimux'
  finish
endif

let g:VimuxUseNearestPane = 1
" nnoremap <leader>a :call VimuxRunCommand("spring rspec --fail-fast")<CR>
" nnoremap <leader>A :call VimuxRunCommand("spring rspec")<CR>
" nnoremap <leader>cu :call VimuxRunCommand("spring cucumber")<CR>
" nnoremap <leader>ca :call VimuxRunCommand("spring cucumber; spring rspec")<CR>
nnoremap <leader>tp :VimuxPromptCommand<CR>
nnoremap <leader>tx :VimuxRunCommand("clear")<CR>
nnoremap <leader>tc :VimuxCloseRunner<CR>
nnoremap <leader>tz :VimuxZoomRunner<CR>

function! WriteAndVimuxRunLastCommand()
  :call WriteBufferIfNecessary()
  :call VimuxRunLastCommand()
endfunction
nnoremap <leader>tw :call WriteAndVimuxRunLastCommand()<CR>
" command! REmigrate :call VimuxRunCommand("rake db:drop db:create db:migrate test:prepare")
" command! Migrate :call VimuxRunCommand("rake db:migrate test:prepare")
" command! Rollback :call VimuxRunCommand("rake db:rollback")

"Vimux as tslime replacement
function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <leader>tr "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <leader>tr vip<leader>tr<CR>

