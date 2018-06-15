" https://github.com/yuttie/comfortable-motion.vim
if exists('g:vundle_installing_plugins')
  Plugin 'yuttie/comfortable-motion.vim'
  finish
endif

" mouse support
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

" modify Ctrl-j and Ctrl-k
nnoremap <silent> <C-j> :call comfortable_motion#flick(150)<CR>
nnoremap <silent> <C-k> :call comfortable_motion#flick(-150)<CR>
