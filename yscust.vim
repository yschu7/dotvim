" =====================================================
" Vim configuration.
" -----------------------------------------------------
" ~/.vim/config.vim       Regular Vim Configuration
" =====================================================
" Basic Settings  {{{
if exists("$GOROOT")
  set rtp+=$GOROOT/misc/vim  " Go setting
endif

set showcmd                  " Display incomplete commands.
set visualbell               " No beeping.
set nobackup                 " Don't make a backup before overwriting a file.
set nowritebackup            " And again.

" Only highlight the exceeding character at the margin (colorcolumn=80)
highlight ColorColumn ctermfg=magenta

" True color support in nvim
if has('nvim')
  set termguicolors
endif
" }}}

" ==================================
" Basic Maps
" ~/.vim/mappings.vim   Mappings
" ==================================

" ===================================
" Filetypes
" ~/.vim/autocmds.vim   AutoCommands
" ===================================
" Auto change the directory to the current file I'm working on
"autocmd BufEnter * lcd %:p:h

" AutoCommands settings  {{{
augroup YSAutoCommands
  " Clear the auto command group so we don't define it multiple times
  autocmd!

  " make the following files plsql files
  au BufNewFile,BufRead *.fun,*.pks,*.pkb,*.sql,*.pls,*.plsql setlocal filetype=plsql
  au FileType plsql runtime! indent.vim

  " Enter selects subject
  au FileType help nnoremap <buffer><cr> <c-]>
  " ESC to go back
  au FileType help nnoremap <buffer><ESC> <C-T>

  " If we're editing a .txt file then skip line numbers
  autocmd BufRead,BufNewFile *.txt setlocal nonu

  autocmd BufEnter *.txt call HelpInNewTab()
  "Only apply to help files
  fun! HelpInNewTab()
    if &buftype == 'help'
      "Convert the help window to a tab
      execute "normal \<C-W>T"
    endif
  endfun

  " Automatic fold settings for specific files.
  autocmd FileType ruby   setlocal foldmethod=syntax
  autocmd FileType vim    setlocal foldmethod=marker
  autocmd FileType css    setlocal foldmethod=indent shiftwidth=2 tabstop=2 softtabstop=2

  au FileType python,swift,java setlocal fdm=indent sw=4 ts=4 sts=4

  au FileType markdown setlocal fdm=marker ts=4 sw=4 sts=4 nospell

  au FileType ruby,python,java,swift,javascript,php,rust,sh,vim,go setlocal matchpairs-=<:>
  au FileType c,cpp,plsql,coffee setlocal matchpairs-=<:>

  " automatically give executable permissions if file begins with #! and
  " contains '/bin/' in the path (replaced by vim-eunuch)
  fun! AfterWrite()
    if getline(1) =~ "^#!" && getline(1) =~ "/bin/"
      silent !chmod a+x <afile>
    endif
  endfun
  autocmd BufWritePost * call AfterWrite()

  fun! RustCompileAndRun()
    silent !clear
    execute "! rustc " . expand('%:t') . " && ./" . expand('%:r')
  endfun

  fun! JavaCompileAndRun()
    silent !clear
    execute "! javac " . expand('%:t') . " && java " . expand('%:r')
  endfun

  fun! AsciiCompileAndOpen()
    silent !clear
    execute "! asciidoctor " . expand('%:t') . " && open -a '/Applications/Google Chrome.app'  ./" . expand('%:r') . ".html"
  endfun

  " Define <F5> depends on filetype
  autocmd FileType swift nnoremap <buffer><F5> <ESC>:up!<CR>:!xcrun swift ./%<CR>
  autocmd FileType swift inoremap <buffer><F5> <ESC>:up!<CR>:!xcrun swift ./%<CR>
  autocmd FileType javascript nnoremap <buffer><F5> <ESC>:up!<CR>:!node ./%<CR>
  autocmd FileType javascript inoremap <buffer><F5> <ESC>:up!<CR>:!node ./%<CR>
  autocmd FileType ruby nnoremap <buffer><F5> <ESC>:up!<CR>:!ruby ./%<CR>
  autocmd FileType ruby inoremap <buffer><F5> <ESC>:up!<CR>:!ruby ./%<CR>
  autocmd FileType python nnoremap <buffer><F5> <ESC>:up!<CR>:!python3 ./%<CR>
  autocmd FileType python inoremap <buffer><F5> <ESC>:up!<CR>:!python3 ./%<CR>
  autocmd FileType vim nnoremap <buffer><F5> <ESC>:up!<CR>:source ./%<CR>
  autocmd FileType vim inoremap <buffer><F5> <ESC>:up!<CR>:source ./%<CR>
  autocmd FileType sh nnoremap <buffer><F5> <ESC>:up!<CR>:!clear<CR>:!bash ./%<CR>
  autocmd FileType sh inoremap <buffer><F5> <ESC>:up!<CR>:!clear<CR>:!bash ./%<CR>
  autocmd FileType rust nnoremap <buffer><F5> <ESC>:up!<CR>:call RustCompileAndRun()<CR>
  autocmd FileType rust inoremap <buffer><F5> <ESC>:up!<CR>:call RustCompileAndRun()<CR>
  autocmd FileType asciidoc nnoremap <buffer><F5> <ESC>:up!<CR>:call AsciiCompileAndOpen()<CR>
  autocmd FileType asciidoc inoremap <buffer><F5> <ESC>:up!<CR>:call AsciiCompileAndOpen()<CR>
  autocmd FileType java nnoremap <buffer><F5> <ESC>:up!<CR>:call JavaCompileAndRun()<CR>
  autocmd FileType java inoremap <buffer><F5> <ESC>:up!<CR>:call JavaCompileAndRun()<CR>
  autocmd FileType markdown nnoremap <buffer><F5> <ESC>:up!<CR>:MarkedOpen!<CR>
  autocmd FileType markdown inoremap <buffer><F5> <ESC>:up!<CR>:MarkedOpen!<CR>

  " [Buffer-Local](http://learnvimscriptthehardway.stevelosh.com/chapters/11.html)
  " tmux run script (Split screen to show result)
  au FileType ruby nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("ruby ".expand('%:p')."\n")<CR>
  au FileType python nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("python ".expand('%:p')."\n")<CR>
  au FileType go nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("go run ".expand('%:p')."\n")<CR>
  au FileType javascript nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("node ".expand('%:p')."\n")<CR>
  au FileType coffee nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("coffee ".expand('%:p')."\n")<CR>
  au FileType rust nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("clear && rustc ".expand('%:t')." && ./".expand('%:r')."\n")<CR>
  au FileType java nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("clear && javac ".expand('%:t')." && java ".expand('%:t:r')."\n")<CR>

  " Leave paste mode on exit
  au InsertLeave * set nopaste

  " F6 : Dispatch configuration
  autocmd FileType java   let b:dispatch = 'javac %'
  autocmd FileType rust   let b:dispatch = 'rustc %'
  autocmd FileType ruby   let b:dispatch = 'ruby %'
  autocmd FileType python let b:dispatch = 'python3 %'

augroup END
" }}}

" ===================
"  Function Keys  {{{
" ===================
" F1 Help
noremap <F1> <Esc>:help<CR>

" Cycle through relativenumber + number, number (only), and no numbering.
function! Cycle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!<CR>
  endif
endfunction

nnoremap <silent> <F2> :call Cycle_numbering()<CR>
inoremap <silent> <F2> <Esc>:call Cycle_numbering()<CR>a

" F3 : Spell check
function! ToggleSpell()
    if !exists("b:spell")
        setlocal spell spelllang=en_us
        let b:spell = 1
    else
        setlocal nospell
        unlet b:spell
    endif
endfunction

nnoremap <F3> :call ToggleSpell()<CR>
inoremap <F3> <Esc>:call ToggleSpell()<CR>a

" F4 : Paste with paste mode
function! PasteWithPasteMode()
  if &paste
    normal p
  else
    " Enable paste mode and paste the text, then disable paste mode.
    set paste
    normal p
    set nopaste
  endif
endfunction

command! PasteWithPasteMode call PasteWithPasteMode()
nnoremap <silent> <F4> :PasteWithPasteMode<CR>

" F5 : run script
nnoremap <F5> <ESC>:up!<CR>:! ./%<CR>
inoremap <F5> <ESC>:up!<CR>:! ./%<CR>

" F6 : [Dispatch](https://github.com/tpope/vim-dispatch)
nnoremap <F6> :Dispatch<CR>

if has('nvim')
  let test#strategy = "neovim"
else
  let test#strategy = "dispatch"
endif

" F7 : Taglist toggle
nnoremap <silent><F7> :TlistToggle<CR>

" F8 : Undo graph toggle
nnoremap <silent><F8> :GundoToggle<CR>

" F9 : SetColor (~/.vim/pref/setcolors.vim)
" F9 (next), <Shift>-F9 (prev), <Alt>-F9 (random)
noremap <silent> <leader>sc :SetColor all<CR>
" ChgColor: Change Colorscheme
noremap <silent> <leader>ic :ChgColor<CR>
" ChgAirColor: Change Airpline Colorscheme
noremap <silent> <leader>ia :ChgAirColor<CR>
" }}}

" ============================
" Source file : ysmain.vim {{{
" ~/.vim/pref/ysmain.vim
" ============================
let g:w32_dir = g:dotvim_dir . '\pref\'
let g:lnx_dir = g:dotvim_dir . '/pref/'
if has('win32') || has('win64')
  let fn = w32_dir . 'ysmain.vim'
else
  let fn = lnx_dir . 'ysmain.vim'
endif
execute ':source ' . fn
" }}}

