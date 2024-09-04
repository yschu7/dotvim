" =====================================================
" Vim configuration.
" -----------------------------------------------------
" ~/.dotvim/config.vim       Regular Vim Configuration
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

" Neovim specific settings
if has('nvim')
  source ~/.dotvim/ysnvim.vim
else
  set ttymouse=xterm2
endif
" }}}

" Basic Maps
" ---------------------------------
" ~/.dotvim/mappings.vim   Mappings
" ---------------------------------

" Filetypes
" -------------------------------------
" ~/.dotvim/autocmds.vim   AutoCommands
" -------------------------------------

" ===================
"  Function Keys  {{{
" ===================
" F1 Help
noremap <silent><F1> <Esc>:help<CR>

" F2 Cycle through relativenumber + number, number (only), and no numbering.
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

nnoremap <silent><F2> :call Cycle_numbering()<CR>
inoremap <silent><F2> <Esc>:call Cycle_numbering()<CR>a

" F3 Toggle Spell check

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

nnoremap <F3> :call ToggleSpell()<CR>
inoremap <F3> <Esc>:call ToggleSpell()<CR>a

" F4 : QuickFix Windows toggle
let g:quickfix_is_open = 0

function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

nnoremap <silent><leader>q :call <SID>QuickfixToggle()<CR>
nnoremap <silent> <F4> :call <SID>QuickfixToggle()<CR>

" F5 : run script
nnoremap <F5> <ESC>:WriteBufferIfNecessary<CR>:! ./%<CR>
inoremap <F5> <ESC>:WriteBufferIfNecessary<CR>:! ./%<CR>

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

" F9 : SetColor (~/.dotvim/pref/setcolors.vim)
" F9 (next), <Shift>-F9 (prev), <Alt>-F9 (random)
noremap <silent><leader>sc :SetColor all<CR>
" ChgColor: Change Colorscheme
noremap <silent><leader>ic :ChgColor<CR>
" ChgAirColor: Change Airpline Colorscheme
noremap <silent><leader>ia :ChgAirColor<CR>
" }}}

"  Source file : ysmain.vim {{{
"  -------------------------
"  ~/.dotvim/pref/ysmain.vim
"  -------------------------
" g:dotvim_dir defined in ~/.dotvim/platforms.vim
let g:w32_dir = g:dotvim_dir . '\pref\'
let g:lnx_dir = g:dotvim_dir . '/pref/'
if has('win32') || has('win64')
  let fn = w32_dir . 'ysmain.vim'
else
  let fn = lnx_dir . 'ysmain.vim'
endif
execute ':source ' . fn
" }}}

