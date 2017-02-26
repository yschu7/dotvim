" ==============================
"   dbextlnx.vim : Linux & Mac
" ==============================
let g:dbext_default_history_file = expand('~/') . '.dbext_history'
let g:dbext_default_history_size = 500
let g:dbext_default_DBI_split_on_pattern = ';'
let g:dbext_default_autoclose = 1
let g:dbext_default_autoclose_min_lines = 2

" Disable async jobs if sqlplus connection display warning message...
" check ~/login.sql : sqlcl and sqlplus is not compatible
" let g:dbext_default_use_jobs = 0
" let g:dbext_default_DBI_commit_on_disconnect = 0

" Load common dbextpc.vim
" g:lnx_dir global var defined in ~/.vim/yscust.vim
" let fn = expand("$HOME") . g:lnx_dir . 'dbextpc.vim'
let fn = g:lnx_dir . 'dbextpc.vim'
if filereadable(fn)
  execute ':source ' . fn
endif

