" --------
" gist-vim
" --------
" copy the gist code with option '-c'
if has('macunix') || has('mac')
  let g:gist_clip_command = 'pbcopy'
else
  let g:gist_clip_command = 'xclip -selection clipboard'
endif

" your gist to be private by default
"let g:gist_post_private = 1

" detect filetype from the filename
let g:gist_detect_filetype = 1
