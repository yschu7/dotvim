" =====================================================
" Vim configuration.
" To work with mutewinter dotvim environment
" =====================================================

if exists("$GOROOT")
  set rtp+=$GOROOT/misc/vim  " Go setting
endif

" syntax on                    " Turn on syntax highlighting.

" runtime macros/matchit.vim   " Load the matchit plugin.

set showcmd                  " Display incomplete commands.
set showmode                 " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                   " Handle multiple buffers better.

" set wildmenu                 " Enhanced command line completion.
" set wildmode=list:longest    " Complete files like a shell.

set ignorecase               " Case-insensitive searching.
set smartcase                " But case-sensitive if expression contains a capital letter.

set number                   " Show line numbers.
set ruler                    " Show cursor position.

set incsearch                " Highlight matches as you type.
set hlsearch                 " Highlight matches.

set wrap                     " Turn on line wrapping.
set scrolloff=2              " Show 2 lines of context around the cursor.

set title                    " Set the terminal's title

set visualbell               " No beeping.

set nobackup                 " Don't make a backup before overwriting a file.
set nowritebackup            " And again.

set tabstop=2                " Global tab width.
set shiftwidth=2             " And again, related.
set expandtab                " Use spaces instead of tabs

set laststatus=2             " Show the status line all the time
" Useful status information at bottom of screen
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y[%{&ff},%{&fileencoding}][%b][0x%B]\ %=%-16(\ %l/%L[%p%%],%c\ %)

set cursorline               " nocursorline (cul/nocul)

set fencs=utf-8,big5,gbk,latin1

" =====================================================
" Basic Maps
" https://github.com/mitechie/pyvim/blob/master/.vimrc
" =====================================================
let mapleader="," " change the leader to be a comma vs slash

" map ctrl-c to something else so I quick using it
map <c-c> <Nop>
imap <c-c> <Nop>

" Y yanks to the end of the line
nmap Y y$

" shortcuts for copying to clipboard
" nmap <leader>y "*y
" vmap <leader>y "*y
" copy the current line to clipboard
" nmap <leader>yy "*yy
" nmap <leader>p "*p

" show the registers from things cut/yanked
nmap <leader>r :registers<CR>

" visual mode indent with <TAB> and <S-TAB>
"nmap <TAB> v>
"nmap <s-TAB> v<
vmap <TAB> >gv
vmap <s-TAB> <gv

" map the various registers to a leader shortcut for pasting from them
nmap <leader>0 "0p
nmap <leader>1 "1p
nmap <leader>k "kp

" shortcuts to open/close the quickfix window
" nmap <leader>c :copen<CR>
" nmap <leader>cc :cclose<CR>

" F5 : run script
nmap <F5> <ESC>:up!<CR>:! ./%<CR>
imap <F5> <ESC>:up!<CR>:! ./%<CR>
autocmd FileType swift nmap <F5> <ESC>:up!<CR>:!xcrun swift ./%<CR>
autocmd FileType swift imap <F5> <ESC>:up!<CR>:!xcrun swift ./%<CR>
autocmd FileType javascript nmap <F5> <ESC>:up!<CR>:!node ./%<CR>
autocmd FileType javascript imap <F5> <ESC>:up!<CR>:!node ./%<CR>

" Press Ctrl-N to turn off highlighting.
nmap <silent> <C-N> :silent noh<CR>

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Clean all end of line extra whitespace with ,S
" Credit: voyeg3r https://github.com/mitechie/pyvim/issues/#issue/1
" deletes excess space but maintains the list of jumps unchanged
" for more details see: h keepjumps
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
map <silent><leader>S <esc>:keepjumps call CleanExtraSpaces()<cr>

" ==================================================
" Filetypes
" ==================================================
" Auto change the directory to the current file I'm working on
"autocmd BufEnter * lcd %:p:h

" make the smarty .tpl files html files for our purposes
"au BufNewFile,BufRead *.tpl set filetype=html
au BufNewFile,BufRead *.pls set filetype=plsql

" Filetypes (au = autocmd)
"au FileType help set nonumber " no line numbers when viewing help
au FileType help nnoremap <buffer><cr> <c-]> " Enter selects subject
au FileType help nnoremap <buffer><ESC> <C-T> " ESC to go back

" for markdown -- insert 4 spaces to the end of line (is: insert spaces)
au FileType markdown noremap <buffer><silent> <leader>is A<Space><Space><Space><Space><ESC>

au FileType markdown set tabstop=4                " Global tab width.
au FileType markdown set shiftwidth=4             " And again, related.

" If we're editing a .txt file then skip line numbers
au! BufRead,BufNewFile *.txt set nonu

" automatically give executable permissions if file begins with #! and
" contains '/bin/' in the path
fun! AfterWrite()
  if getline(1) =~ "^#!" && getline(1) =~ "/bin/"
     silent !chmod a+x <afile>
  endif
endfun
au BufWritePost * call AfterWrite()

" ==================================================
" Windows / Splits
" ==================================================
" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
imap <C-W> <C-O><C-W>

" use - and + to resize horizontal splits
map - <C-W>-
map + <C-W>+

" and for vsplits with alt-< or alt->
map <M-,> <C-W>>
map <M-.> <C-W><

" F2 close current window
noremap <f2> <Esc>:close<CR><Esc>

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
  if &wrap
    return "g" . a:movement
  else
    return a:movement
  endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

" Automatic fold settings for specific files. Uncomment to use.
autocmd FileType ruby   setlocal foldmethod=syntax
autocmd FileType css    setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType python setlocal foldmethod=indent shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType swift  setlocal foldmethod=indent shiftwidth=4 tabstop=4 softtabstop=4

" NERDTree
noremap <silent> <leader>nt :NERDTree<CR>

" ChgColor: Change Colorscheme
noremap <silent> <leader>ic :ChgColor<CR>

" SetColor: F7, <Shift>-F7, <Alt>-F7
noremap <silent> <leader>sc :SetColor my<CR>

" Spell check
function! ToggleSpell()
    if !exists("b:spell")
        setlocal spell spelllang=en_us
        let b:spell = 1
    else
        setlocal nospell
        unlet b:spell
    endif
endfunction

" Toggle paste mode with F3
nnoremap <silent> <F3> :set paste!<CR>

nmap <F4> :call ToggleSpell()<CR>
imap <F4> <Esc>:call ToggleSpell()<CR>a

" Emmet
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1
" Enable just for html/css
autocmd FileType css imap <tab> <plug>(EmmetExpandAbbr)
autocmd FileType html,htm imap <tab> <plug>(EmmetExpandAbbr)

let g:w32_dir = '\vimfiles\pref\'
let g:lnx_dir = '/.vim/pref/'
if has('win32')
  let fn = expand("$HOME") . w32_dir . 'platform.vim'
else
  let fn = expand("$HOME") . lnx_dir . 'platform.vim'
endif
execute ':source ' . fn

