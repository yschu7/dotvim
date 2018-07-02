" https://github.com/tomtom/tcomment_vim
if exists('g:vundle_installing_plugins')
  Plugin 'tomtom/tcomment_vim'
  finish
endif

let g:tcomment_maps = 1
nnoremap <silent><leader>cc :TComment<CR>
vnoremap <silent><leader>cc :TComment<CR>
nnoremap <silent><leader>cb :TCommentBlock<CR>
vnoremap <silent><leader>cb :TCommentBlock<CR>
