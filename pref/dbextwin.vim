" ============================
"    dbextwin : Windows
" ============================
let orauser    = 'hr'         " Oracle default user
let orapasswd  = 'pass01'     " General password 
let orahost    = 'ubuntu64'   " Oracle host
let orasrvname = 'u64orcl'    " Oracle service name
let oraport    = '1521'       " Oracle listener port
let orasid     = 'orcl'       " Oracle SID
let myuser     = 'yschu'      " MySQL default user
let mypasswd   = 'pass01'     " General password 
let myhost     = 'ubuntu64'   " MySQL host
let mydb       = 'test'       " MySQL default database
" dbext profile
let g:dbext_default_profile_oracle = 'type=ORA:user=' . orauser . ':passwd=' . orapasswd . ':srvname=' . orasrvname
let g:dbext_default_profile_oracle_DBI = 'type=DBI:user=' . orauser . ':passwd=' . orapasswd . ':driver=Oracle:conn_parms=sid=' . orasid . ';host=' . orahost . ':port=1521'
let g:dbext_default_profile_mysql= 'type=MYSQL:user=' . myuser . ':passwd=' . mypasswd . ':host=' . myhost . ':dbname=' . mydb . ':extra=-t' 
let g:dbext_default_profile_mysql_DBI = 'type=DBI:user=' . myuser . ':passwd=' . mypasswd . ':driver=mysql:conn_parms=database='. mydb . ';host=' . myhost
let g:dbext_default_profile_oracle_URL = 'type=ORA:srvname=//'. orahost . '\:' . oraport . '/' . orasid . ':user=' . orauser . ':passwd=' . orapasswd

let g:dbext_default_history_file = 'g:\Oracle\PLSQL\history.txt'
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

" personal customized dbext
" w32_dir global in vimrc
let fn = expand("$HOME") . w32_dir . 'dbextpc.vim'
if filereadable(fn)
  execute ':source ' . fn
endif 

