" -----------------------------------------------
" source file of $HOME/.ideavimrc
"
" > cd
" > ln -s ~/.vim/pref/ideavimrc.vim .ideavimrc
"
" https://github.com/JetBrains/ideavim
" -----------------------------------------------

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","
let maplocalleader = "\\"

" ---------------
" Regular Mappings
" ---------------

" Yank entire buffer with gy
nnoremap gy :0,$ y<cr>

" Select entire buffer
nnoremap vy ggVG

" Make Y behave like other capital commands.
" Hat-tip http://vimbits.com/bits/11
nnoremap Y y$

" Just to beginning and end of lines easier. From http://vimbits.com/bits/16
" noremap H ^
" noremap L $

" Create newlines without entering insert mode
nnoremap go o<Esc>k
nnoremap gO O<Esc>j

" remap U to <C-r> for easier redo
" from http://vimbits.com/bits/356
nnoremap U <C-r>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" ---------------
" Modifer Mappings
" ---------------

" Scroll larger amounts with C-j / C-k
nnoremap <C-j> 15gjzz
nnoremap <C-k> 15gkzz
vnoremap <C-j> 15gjzz
vnoremap <C-k> 15gkzz

" ---------------
" Insert Mode Mappings
" ---------------

" Let's make escape better, together.
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

"-------------
" YS mappings
"
" use :actionlist [command] to check available commands
"-------------
nnoremap gc :action CommentByLineComment<CR>
nnoremap <leader>d :action CloseContent<CR>

nnoremap <leader>n :action NextTab<CR>
nnoremap <leader>p :action PreviousTab<CR>
nnoremap <leader>r :action Run<CR>
nnoremap <leader>R :action RunClass<CR>

" built in search looks better
nnoremap / :action Find<cr>
" but preserve ideavim search
nnoremap g/ /

" easy system clipboard copy/paste
noremap <leader>Y "*Y
noremap <leader>P "*P

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
noremap <leader>v :sp ~/.ideavimrc<CR>
noremap <silent> <leader>V :source ~/.ideavimrc<CR>

" visual mode indent with <TAB> and <S-TAB>
"nnoremap <TAB> v>
"nnoremap <s-TAB> v<
vnoremap <TAB> >gv
vnoremap <s-TAB> <gv

nnoremap <leader>w :w<CR>

" Quickly switch to last buffer
nnoremap <leader>, :e#<CR>

" Swap v and CTRL-V, because Block mode is more useful that Visual mode
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

" ---------------
" Typo Fixes
" ---------------

cnoremap w' w<CR>

" Removes doc lookup mapping because it's easy to fat finger and never useful.
nnoremap K k
vnoremap K k

noreabbrev teh the

" Plugins
" Emulates vim-surround
set surround
