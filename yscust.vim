" =====================================================
" Vim configuration.
" To work with mutewinter dotvim environment
" ~/.vim/config.vim       Regular Vim Configuration
" =====================================================
if exists("$GOROOT")
  set rtp+=$GOROOT/misc/vim  " Go setting
endif

set showcmd                  " Display incomplete commands.
set visualbell               " No beeping.
set nobackup                 " Don't make a backup before overwriting a file.
set nowritebackup            " And again.

set wrap                     " Turn on line wrapping.
" Useful status information at bottom of screen
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y[%{&ff},%{&fileencoding}][%b][0x%B]\ %=%-16(\ %l/%L[%p%%],%c\ %)
set cursorline               " nocursorline (cul/nocul)
set fencs=utf-8,big5,gbk,latin1

" =====================================================
" Basic Maps
" ~/.vim/mappings.vim       Mappings
" =====================================================

" map ctrl-c to something else so I quick using it
map <c-c> <Nop>
imap <c-c> <Nop>

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

" Press Ctrl-N to turn off highlighting.
nmap <silent> <C-N> :silent noh<CR>

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

augroup YSAutoCommands
  " Clear the auto command group so we don't define it multiple times
  " Idea from http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
  autocmd!
  " make the smarty .tpl files html files for our purposes
  "au BufNewFile,BufRead *.tpl set filetype=html
  au BufNewFile,BufRead *.pls setlocal filetype=plsql

  " Filetypes (au = autocmd)
  "au FileType help set nonumber " no line numbers when viewing help
  au FileType help nnoremap <buffer><cr> <c-]> " Enter selects subject
  au FileType help nnoremap <buffer><ESC> <C-T> " ESC to go back

  " for markdown -- insert 4 spaces to the end of line (is: insert spaces)
  au FileType markdown nnoremap <buffer><silent><leader>is A<Space><Space><Space><Space><ESC>

  au FileType markdown setlocal tabstop=4 shiftwidth=4 softtabstop=4

  " If we're editing a .txt file then skip line numbers
  au BufRead,BufNewFile *.txt setlocal nonu

  " Automatic fold settings for specific files.
  autocmd FileType ruby   setlocal foldmethod=syntax
  autocmd FileType css    setlocal foldmethod=indent shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType python setlocal foldmethod=indent shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType swift  setlocal foldmethod=indent shiftwidth=4 tabstop=4 softtabstop=4

  " automatically give executable permissions if file begins with #! and
  " contains '/bin/' in the path (replaced by vim-eunuch)
  fun! AfterWrite()
  if getline(1) =~ "^#!" && getline(1) =~ "/bin/"
      silent !chmod a+x <afile>
  endif
  endfun
  autocmd BufWritePost * call AfterWrite()

  " Define <F5> depends on filetype
  autocmd FileType swift nnoremap <buffer><F5> <ESC>:up!<CR>:!xcrun swift ./%<CR>
  autocmd FileType swift inoremap <buffer><F5> <ESC>:up!<CR>:!xcrun swift ./%<CR>
  autocmd FileType javascript nnoremap <buffer><F5> <ESC>:up!<CR>:!node ./%<CR>
  autocmd FileType javascript inoremap <buffer><F5> <ESC>:up!<CR>:!node ./%<CR>
  autocmd FileType ruby nnoremap <buffer><F5> <ESC>:up!<CR>:!ruby ./%<CR>
  autocmd FileType ruby inoremap <buffer><F5> <ESC>:up!<CR>:!ruby ./%<CR>
  autocmd FileType python nnoremap <buffer><F5> <ESC>:up!<CR>:!python3 ./%<CR>
  autocmd FileType python inoremap <buffer><F5> <ESC>:up!<CR>:!python3 ./%<CR>

  " [Buffer-Local](http://learnvimscriptthehardway.stevelosh.com/chapters/11.html)
  " tmux run script
  au FileType ruby nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("ruby ".expand('%:p')."\n")<CR>
  au FileType python nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("python ".expand('%:p')."\n")<CR>
  au FileType go nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("go run ".expand('%:p')."\n")<CR>
  au FileType javascript nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("node ".expand('%:p')."\n")<CR>
  au FileType coffee nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("coffee ".expand('%:p')."\n")<CR>

  " Leave paste mode on exit
  au InsertLeave * set nopaste
augroup END

" ==================================================
" Windows / Splits
" ==================================================
" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
imap <C-W> <C-O><C-W>

" use - and + to resize horizontal splits
map - <C-W>-
map + <C-W>+

" and for vsplits with <TAB> and Shift<TAB>
nmap <TAB> <C-W>>
nmap <s-TAB> <C-W><

" F1 delete current buffer
noremap <F1> <Esc>:bd<CR>

" F2 close current window
noremap <F2> <Esc>:close<CR><Esc>

" F3 Toggle paste mode
"nnoremap <silent> <F3> :set paste!<CR>
noremap <silent> <F3> :set paste<CR>o

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

nnoremap <F4> :call ToggleSpell()<CR>
inoremap <F4> <Esc>:call ToggleSpell()<CR>a

" F5 : run script
nnoremap <F5> <ESC>:up!<CR>:! ./%<CR>
inoremap <F5> <ESC>:up!<CR>:! ./%<CR>

" ChgColor: Change Colorscheme
noremap <silent> <leader>ic :ChgColor<CR>

" SetColor: F7, <Shift>-F7, <Alt>-F7
noremap <silent> <leader>sc :SetColor my<CR>

" ChgAirColor: Change Airpline Colorscheme
noremap <silent> <leader>ia :ChgAirColor<CR>

let g:w32_dir = '\vimfiles\pref\'
let g:lnx_dir = '/.vim/pref/'
if has('win32')
  let fn = expand("$HOME") . w32_dir . 'platform.vim'
else
  let fn = expand("$HOME") . lnx_dir . 'platform.vim'
endif
execute ':source ' . fn

