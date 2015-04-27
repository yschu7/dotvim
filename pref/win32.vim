" ===========
"   Windows
" ===========
" Keep swap files in one location
set directory=$HOME/vimfiles/tmp//,.  

" set path for searching cmd like: gf, <c-w>f, <c-w>gf
" use :set path< to copy this global value to local buffers
set path=g:/Ruby/YSTest/**,,.

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/vimfiles/vimrc<CR><C-W>_
map <silent> <leader>V :source ~/vimfiles/vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ,h brings up my Vim-notes.txt
map <leader>h :sp ~/vimfiles/pref/Vim-notes.txt<CR><C-W>_

" fencview
let g:fencview_autodetect=1
let g:fencview_checklines=0

" SQLPlus
"let g:sqlplus_userid = "hr"
"let g:sqlplus_passwd = "pass01" 
"let g:sqlplus_path = "sqlplus -S "

"Ctrl+A = Select All
map <C-a> <Esc>ggVG 
"Ctrl+tab = Fwd Cycle across splits
map <C-Tab> <Esc><C-w>w
"Ctrl+Shift+tab = Reverse Cycle across splits
map <C-S-Tab> <Esc><C-w>W

let g:pydiction_location = expand("~") . '/vimfiles/bundle/vim-python/ftplugin/pydiction/complete-dict' 

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

