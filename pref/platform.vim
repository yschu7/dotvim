" Source file 
func! Source_file(dirname, fname)
  let fn = expand("$HOME") . a:dirname . a:fname
  execute ':source ' . fn
endf

" Common files 
let c_lnxmac = 'lnxmac.vim'   " common for linux and mac
let c_eval   = 'eval.vim'
let c_setcol = 'setcolors.vim'
let c_tetris = 'tetris.vim'

"w32_dir, lnx_dir : global in vimrc
if has('win32')
  let call_list = ['win32.vim', c_eval, c_setcol, c_tetris]
  for vimfile in call_list
    call Source_file(g:w32_dir, vimfile)
  endfor
elseif has('mac')
  let call_list = ['mac.vim', c_lnxmac, c_eval, c_setcol, c_tetris]
  for vimfile in call_list
    call Source_file(g:lnx_dir, vimfile)
  endfor
else
  let call_list = ['linux.vim', c_lnxmac, c_eval, c_setcol, c_tetris]
  for vimfile in call_list
    call Source_file(g:lnx_dir, vimfile)
  endfor
endif

"------------------------------Common----------------------------------
let g:dbext_default_history_size = 500
let g:dbext_default_DBI_split_on_pattern = ';'
let g:dbext_default_autoclose = 1
let g:dbext_default_autoclose_min_lines = 2

"let g:dbext_default_DBI_commit_on_disconnect = 0
vnoremap <silent> <F9> :DBExecVisualSQL<CR>
nnoremap <silent> <F9> :DBExecSQLUnderCursor<CR>
inoremap <silent> <F9> <ESC>:DBExecSQLUnderCursor<CR>

" redefine <F5> in bundle/sql/ftplugin/sql_iabbr.vim (buffer level)
" filetype = sql, pls, plsql
" iab sdt select dbms_metadata.get_ddl('TABLE','EMPLOYEES') from dual;

