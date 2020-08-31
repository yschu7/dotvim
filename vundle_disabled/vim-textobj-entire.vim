" https://github.com/kana/vim-textobj-entire
if exists('g:vundle_installing_plugins')
  Plugin 'kana/vim-textobj-entire'
  finish
endif

" vim-textobj-entire provides two text objects:
"
" ae : targets the entire content of the current buffer.
" ie : is similar to ae, but ie does not include leading and trailing empty lines.

" cpae : copy the entire content to system clipboard(cp)
" dae  : delete all
" gsie : sort(gs) all except leading and trailing empty lines
