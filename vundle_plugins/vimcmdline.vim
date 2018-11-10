" --------------
" vimcmdline.vim
" --------------

" https://github.com/jalvesaq/vimcmdline
if exists('g:vundle_installing_plugins')
  Plugin 'jalvesaq/vimcmdline'
  finish
endif

" vimcmdline options
let cmdline_vsplit      = 1      " Split the window vertically

let cmdline_app           = {}
let cmdline_app['python'] = 'python3'
let cmdline_app['ruby']   = 'pry'
let cmdline_app['sh']     = 'bash'
