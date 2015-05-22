" ===========
"   Windows
" ===========
" Keep swap files in one location
set directory=$HOME/vimfiles/tmp//,.

" set path for searching cmd like: gf, <c-w>f, <c-w>gf
" use :set path< to copy this global value to local buffers
set path=g:/Ruby/YSTest/**,,.

" fencview
let g:fencview_autodetect=1
let g:fencview_checklines=0

"Ctrl+A = Select All
map <C-a> <Esc>ggVG
"Ctrl+tab = Fwd Cycle across splits
map <C-Tab> <Esc><C-w>w
"Ctrl+Shift+tab = Reverse Cycle across splits
map <C-S-Tab> <Esc><C-w>W

" Running under DOS command mode(only has 16 colors)
if !has("gui_running")
  set t_Co=16
  colorscheme textmate16
  " Change cursorline
  map <silent> <leader>u <esc>:hi cursorline ctermfg=Yellow ctermbg=Darkmagenta cterm=bold<CR>
  " autocmd InsertLeave * hi CursorLine term=none cterm=none ctermbg=233
  " autocmd InsertEnter * hi CursorLine term=none cterm=none ctermbg=4
endif

" dbext setting
" w32_dir global in vimrc
let fn = expand("$HOME") . w32_dir . 'dbextwin.vim'
if filereadable(fn)
  execute ':source ' . fn
endif

