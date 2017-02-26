" ========================================
"   dbextpc.vim : profile, key mapping
"   loaded by dbextlnx.vim, dbextwin.vim
" ========================================

" read DB user/password file dbuserpwd.vim from directory ~/.vim/bundle
" real location is: ~/.vim/bundle/dbuserpwd.vim
let w32_dir = g:dotvim_dir . '\bundle\'
let lnx_dir = g:dotvim_dir . '/bundle/'
if has('win32') || has('win64')
  let fn = w32_dir . 'dbuserpwd.vim'
else
  let fn = lnx_dir . 'dbuserpwd.vim'
endif
execute ':source ' . fn

" DBD::Oracle [installation](http://search.cpan.org/~pythian/DBD-Oracle-1.74/)
" macOS [instant clinet notes](https://github.com/kubo/fix_oralib_osx)
" grepg dbext to check my notes
" Oracle profile

let g:dbext_default_use_jobs = 0  " Disable using async job

let g:dbext_default_profile_oracle = 'type=ORA:user=' . orauser . ':passwd=' . orapasswd . ':srvname=' . orasrvname

let g:dbext_default_profile_oracle_DBI = 'type=DBI:user=' . orauser . ':passwd=' . orapasswd . ':driver=Oracle:conn_parms=sid=' . orasid . ';host=' . orahost . ':port=1521'

let g:dbext_default_profile_oracle_URL = 'type=ORA:srvname=//'. orahost . '\:' . oraport . '/' . orasid . ':user=' . orauser . ':passwd=' . orapasswd

" DBD::mysql [installation](https://metacpan.org/pod/DBD::mysql::INSTALL)
" MySQL profile

let g:dbext_default_profile_mysql= 'type=MYSQL:user=' . myuser . ':passwd=' . mypasswd . ':host=' . myhost . ':dbname=' . mydb . ':extra=-t'

let g:dbext_default_profile_mysql_DBI = 'type=DBI:user=' . myuser . ':passwd=' . mypasswd . ':driver=mysql:conn_parms=database='. mydb . ';host=' . myhost

" Ref: [Setup](http://blog.gypsydave5.com/2015/11/17/vim-mac-mssql-client/#fn8)
" /usr/local/etc/odbcinst.ini : Declare freetds as ODBC driver
" ~/.odbc.ini : Set your Host and Database
" MS SQL Server profile

let g:dbext_default_profile_MSSQLServer = 'type=ODBC:user=' . msuser . ':passwd=' . mspasswd . ':dsnname=' . msdsnname

" Mapping
" Reference :h dbext-maps-commands
" noremap <silent> <Leader>sdt <ESC>gUiw:DBDescribeTable<CR>

