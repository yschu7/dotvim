" ============================
"    dbextlnx : Linux & Mac
" ============================
let orauser    = 'hr'         " Oracle default user
let orapasswd  = 'pass01'     " General password 
let orahost    = 'localhost'  " Oracle host
let orasrvname = 'orcl'       " Oracle service name
let oraport    = '1521'       " Oracle listener port
let orasid     = 'orcl'       " Oracle SID
let myuser     = 'yschu'      " MySQL default user
let mypasswd   = 'pass01'     " General password 
let myhost     = 'localhost'  " MySQL host
let mydb       = 'test'       " MySQL default database
" dbext profile
let g:dbext_default_profile_oracle = 'type=ORA:user=' . orauser . ':passwd=' . orapasswd . ':srvname=' . orasrvname
let g:dbext_default_profile_oracle_DBI = 'type=DBI:user=' . orauser . ':passwd=' . orapasswd . ':driver=Oracle:conn_parms=sid=' . orasid . ';host=' . orahost . ':port=1521'
let g:dbext_default_profile_mysql= 'type=MYSQL:user=' . myuser . ':passwd=' . mypasswd . ':host=' . myhost . ':dbname=' . mydb . ':extra=-t' 
let g:dbext_default_profile_mysql_DBI = 'type=DBI:user=' . myuser . ':passwd=' . mypasswd . ':driver=mysql:conn_parms=database='. mydb . ';host=' . myhost
let g:dbext_default_profile_oracle_URL = 'type=ORA:srvname=//'. orahost . '\:' . oraport . '/' . orasid . ':user=' . orauser . ':passwd=' . orapasswd

let g:dbext_default_history_file = expand('~/') . '.dbext_history'
"map <Leader>sdt <ESC>gUiw:DBDescribeTable<Enter>

" personal customized dbext
" lnx_dir global in vimrc
let fn = expand("$HOME") . lnx_dir . 'dbextpc.vim'
if filereadable(fn)
  execute ':source ' . fn
endif 

