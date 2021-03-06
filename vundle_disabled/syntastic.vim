" -------------
" syntastic.vim
" -------------

" ALE for neovim and vim8 : ale.vim

" Only for vim version less than 8
if has('nvim') || v:version > 800
  finish
endif

" https://github.com/vim-syntastic/syntastic
if exists('g:vundle_installing_plugins')
  Plugin 'vim-syntastic/syntastic'
  finish
endif

let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
let g:syntastic_html_checkers = ['handlebars']

" Hat tip http://git.io/SPIBfg
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_full_redraws = 1

let g:syntastic_python_python_exec='/usr/local/bin/python3'
