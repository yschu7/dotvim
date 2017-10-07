" https://github.com/srstevenson/vim-picker
if exists('g:vundle_installing_plugins')
  Plugin 'srstevenson/vim-picker'
  finish
endif

nnoremap <leader>pe <Plug>PickerEdit
"nmap <unique> <leader>ps <Plug>PickerSplit
"nmap <unique> <leader>pt <Plug>PickerTabedit
"nmap <unique> <leader>pv <Plug>PickerVsplit
"nmap <unique> <leader>pb <Plug>PickerBuffer
"nmap <unique> <leader>p] <Plug>PickerTag
nnoremap <leader>ph <Plug>PickerHelp

" https://github.com/jhawthorn/fzy
" fzy is used as the default fuzzy selector. To use an alternative selector:
" If run Vim within tmux:
if exists("$TMUX")
  let g:picker_selector = 'fzy-tmux'
endif

" To specify the height of the window in which the fuzzy selector is opened in Neovim:
" let g:picker_height = 10

" https://github.com/BurntSushi/ripgrep
" File listing is achieved using the best tool for the job: git in Git
" repositories and rg elsewhere, falling back to find if rg is not available.
