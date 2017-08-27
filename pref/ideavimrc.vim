" -----------------------------------------------
" source file of $HOME/.ideavimrc
"
" > cd 
" > ln -s ~/.vim/pref/ideavimrc.vim .ideavimrc
" -----------------------------------------------

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","
let maplocalleader = "\\"

" -----------------------
" Unmapped While Learning
" -----------------------

" No-op ^ and $ while learning H and L
" noremap ^ <nop>
" noremap $ <nop>
" nnoremap <leader>sc <nop>

" ---------------
" Regular Mappings
" ---------------

" Use ; for : in normal and visual mode, less keystrokes
" nnoremap ; :
" vnoremap ; :

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

" Use very magic (Perl-like) regex style
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" ---------------
" Modifer Mappings
" ---------------

" Make line completion easier.
inoremap <C-l> <C-x><C-l>

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

" ---------------
" Leader Mappings
" ---------------

" Clear search
noremap <silent><leader>/ :nohls<CR>

" Highlight search word under cursor without jumping to next
"nnoremap <leader>h *<C-O>

"-------------
" YS mappings
"-------------
" map ctrl-c to something else so I quick using it
nnoremap <c-c> <Nop>
inoremap <c-c> <Nop>

" visual mode indent with <TAB> and <S-TAB>
"nnoremap <TAB> v>
"nnoremap <s-TAB> v<
vnoremap <TAB> >gv
vnoremap <s-TAB> <gv

" show the registers from things cut/yanked
nnoremap <leader>r :registers<CR>

" map the various registers to a leader shortcut for pasting from them
nnoremap <leader>0 "0p
nnoremap <leader>1 "1p
nnoremap <leader>k "kp

" Press Ctrl-N to turn off highlighting.
nnoremap <silent> <C-N> :silent noh<CR>
nnoremap <silent> <BS> :nohlsearch<CR>

" list and select buffer
nnoremap <silent> <leader>l :ls<CR>:b
nnoremap <silent> <leader>d :bd<CR>
nnoremap <silent> <leader>n :bn<CR>
nnoremap <silent> <leader>p :bp<CR>
" nnoremap <leader>w :w<CR>

" Actions after helpgrep
" nnoremap <leader>cn :cnext<CR>
" nnoremap <leader>cnf :cnfile<CR><C-G>
" nnoremap <leader>cp :cprev<CR>
" nnoremap <leader>cpf :cpfile<CR><C-G>
" shortcuts to open/close the quickfix window
" nmap <leader>co :copen<CR>
" nmap <leader>cc :cclose<CR>

" for when we forget to use sudo to open/edit a file
cnoremap w!! w !sudo tee % >/dev/null

"---------
" Windows
"---------
" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
"inoremap <C-W> <C-O><C-W>

" use - and + to resize horizontal splits
nnoremap - <C-W>-
nnoremap + <C-W>+

" and for vsplits with <TAB> and Shift<TAB>
nnoremap <TAB> <C-W>>
nnoremap <s-TAB> <C-W><

" Quickly switch to last buffer
nnoremap <leader>, :e#<CR>

" Underline the current line with '-'
nnoremap <silent> <leader>ul :t.\|s/./-/\|:nohls<cr>

" Underline the current line with '='
nnoremap <silent> <leader>uul :t.\|s/./=/\|:nohls<cr>

" Surround the commented line with lines.
"
" Example:
"          # Test 123
"          becomes
"          # --------
"          # Test 123
"          # --------
nnoremap <silent> <leader>cul :normal "lyy"lpwv$r-^"lyyk"lP<cr>

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

