" ----------------------------------------
" Mappings
" ----------------------------------------

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
nnoremap ; :
vnoremap ; :

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

" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" ---------------
" Window Movement
" ---------------
nnoremap <silent> gh :WriteBufferIfNecessary<CR>:wincmd h<CR>
nnoremap <silent> gj :WriteBufferIfNecessary<CR>:wincmd j<CR>
nnoremap <silent> gk :WriteBufferIfNecessary<CR>:wincmd k<CR>
nnoremap <silent> gl :WriteBufferIfNecessary<CR>:wincmd l<CR>

"    Window Splits
"   -----------------
"      | g1 | g2 | g3
"   -----------------
"    gs
"   -----------------
nnoremap <silent> g1 :WriteBufferIfNecessary<CR>:wincmd v<CR>
nnoremap <silent> g2 :WriteBufferIfNecessary<CR>:wincmd v<bar>:wincmd v<CR>
nnoremap <silent> g3 :WriteBufferIfNecessary<CR>:wincmd v<bar>:wincmd v<bar>
      \:wincmd v<CR>
nnoremap <silent> gs :WriteBufferIfNecessary<CR>:wincmd s<CR>

" Split window vertically or horizontally *and* switch to the new split!
nnoremap <silent> <leader>sp  :split<Bar>:wincmd j<CR>
nnoremap <silent> <leader>vsp :vsplit<Bar>:wincmd l<CR>

" Previous Window
nnoremap <silent> gp :wincmd p<CR>
" Equal Size Windows
nnoremap <silent> g= :wincmd =<CR>
" Swap Windows
nnoremap <silent> gx :wincmd x<CR>

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
nnoremap <leader>l :ls<CR>:b
nnoremap <leader>d :bd<CR>
nnoremap <leader>w :w<CR>

" Actions after helpgrep
" nnoremap <leader>cn :cnext<CR>
" nnoremap <leader>cnf :cnfile<CR><C-G>
" nnoremap <leader>cp :cprev<CR>
" nnoremap <leader>cpf :cpfile<CR><C-G>
" shortcuts to open/close the quickfix window
" nmap <leader>co :copen<CR>
" nmap <leader>cc :cclose<CR>

"---------
" Windows
"---------
" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
inoremap <C-W> <C-O><C-W>

" use - and + to resize horizontal splits
nnoremap - <C-W>-
nnoremap + <C-W>+

" and for vsplits with <TAB> and Shift<TAB>
nnoremap <TAB> <C-W>>
nnoremap <s-TAB> <C-W><

" Toggle spelling mode with ,s
nnoremap <silent> <leader>s :set spell!<CR>

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

" Format the entire file
nnoremap <leader>fef mx=ggG='x

" Format a json file with Python's built in json.tool.
" from https://github.com/spf13/spf13-vim/blob/3.0/.vimrc#L390
nnoremap <leader>jt <Esc>:%!underscore print<CR><Esc>:set filetype=json<CR>
nnoremap <leader>jts <Esc>:%!underscore print --strict<CR><Esc>:set filetype=json<CR>

" ---------------
" Typo Fixes
" ---------------

" noremap <F1> <Esc>
" inoremap <F1> <Esc>
cnoremap w' w<CR>

" Disable the ever-annoying Ex mode shortcut key. Type visual my ass. Instead,
" make Q repeat the last macro instead. *hat tip* http://vimbits.com/bits/263
nnoremap Q @@

" Removes doc lookup mapping because it's easy to fat finger and never useful.
nnoremap K k
vnoremap K k

" Insert date
iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>

" Insert a console statements
iabbrev clg console.log
iabbrev cld console.debug

" copy current file name (relative/absolute) to system clipboard
" from http://stackoverflow.com/a/17096082/22423
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <silent> <leader>yp :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <silent> <leader>yP :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <silent> <leader>yf :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <silent> <leader>yd :let @*=expand("%:p:h")<CR>
endif
