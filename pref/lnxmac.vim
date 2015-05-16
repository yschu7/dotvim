" ==============
"  Linux & Mac
" ==============
" Keep swap files in one location
set directory=$HOME/.vim/tmp//,.

" set path for searching cmd like: gf, <c-w>f, <c-w>gf
" use :set path< to copy this global value to local buffers
set path=~yschu/ruby/**,,.,~yschu/.rvm/rubies/default/lib/ruby/**

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ,h brings up my Vim-notes.txt
map <leader>h :sp ~/.vim/pref/Vim-notes.md<CR><C-W>_
" ,vs brings up my vimrc: yscust.vim
map <leader>vs :sp ~/.vim/yscust.vim<CR><C-W>_

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

let g:pydiction_location = expand("~") . '/.vim/bundle/vim-python/ftplugin/pydiction/complete-dict'

" tmux run script
" fun! SetRunScript()
"   au FileType ruby nmap <leader>tr :up!<CR>:call Send_to_Tmux("ruby ".expand('%:p')."\n")<CR>
"   au FileType python nmap <leader>tr :up!<CR>:call Send_to_Tmux("python ".expand('%:p')."\n")<CR>
"   au FileType go nmap <leader>tr :up!<CR>:call Send_to_Tmux("go run ".expand('%:p')."\n")<CR>
"   au FileType javascript nmap <leader>tr :up!<CR>:call Send_to_Tmux("node ".expand('%:p')."\n")<CR>
"   au FileType coffee nmap <leader>tr :up!<CR>:call Send_to_Tmux("coffee ".expand('%:p')."\n")<CR>
" endfun
" call SetRunScript()
" au! BufEnter * call SetRunScript()

" dbext setting
" lnx_dir global in vimrc
" let fn = expand("$HOME") . lnx_dir . 'dbextlnx.vim'
" if filereadable(fn)
"   execute ':source ' . fn
" endif

" Mac or Linux terminal mode
"if !has("gui_running") && !has('win32')
"  set t_Co=256
"  colorscheme neverlandD
"endif
