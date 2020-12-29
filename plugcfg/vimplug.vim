" [Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug)
" -----------
" vimplug.vim
" -----------

function! PluginReloadAndRun(command)
  execute a:command
endfunction

nnoremap <Leader>pi :call PluginReloadAndRun("PlugInstall")<CR>
nnoremap <Leader>pu :call PluginReloadAndRun("PlugUpdate")<CR>
nnoremap <Leader>pc :call PluginReloadAndRun("PlugClean")<CR>
