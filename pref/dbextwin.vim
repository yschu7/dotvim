" ============================
"    dbextwin.vim : Windows
" ============================
let g:dbext_default_history_file = 'd:\Oracle\PLSQL\history.txt'
let g:dbext_default_ORA_cmd_header =
                             \ "set pagesize 10000\n" .
                             \ "set linesize 10000\n" .
                             \ "set long 10000\n" .
                             \ "set serveroutput on\n" .
                             \ "set wrap off\n" .
                             \ "set sqlprompt \"\"\n" .
                             \ "set flush off\n" .
                             \ "set colsep \"\t\"\n" .
                             \ "set tab off\n\n"

" let g:dbext_default_use_jobs = 0  " Disable using async job
" let g:dbext_default_DBI_commit_on_disconnect = 0

" Load common dbextpc.vim
" g:w32_dir global var defined in ~/.vim/yscust.vim
let fn = g:w32_dir . 'dbextpc.vim'
if filereadable(fn)
  execute ':source ' . fn
endif

