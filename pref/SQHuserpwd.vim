" ==========================================
"        SQHuserpwd.vim
" ==========================================
" https://github.com/joereynolds/SQHell.vim
" :help sqhell

" Sample password file
" copy this to ~/.vim/bundle

"let g:sqh_provider = 'sqlite'
"let g:sqh_provider = 'mysql'
let g:sqh_provider = 'psql'

" MySQL
" let g:sqh_connections = {
"     \ 'default': {
"     \   'user': 'root',
"     \   'password': 'abcd1234',
"     \   'host': 'localhost'
"     \},
"     \ 'live': {
"     \   'user': 'root',
"     \   'password': 'jerw5Y^$Hdfj',
"     \   'host': '46.121.44.392'
"     \}
" \}

" SQLite
" let g:sqh_connections = {
"     \ 'default': {
"     \   'database': '/Users/yschu/sampledb1'
"     \},
"     \ 'live': {
"     \   'database': '/Users/yschu/sampledb2'
"     \}
" \}

" PostgreSQL
let g:sqh_connections = {
    \ 'default': {
    \   'user': 'root',
    \   'password': 'abcd1234',
    \   'host': 'localhost',
    \   'database': 'sampledb1'
    \},
    \ 'live': {
    \   'user': 'root',
    \   'password': 'jerw5Y^$Hdfj',
    \   'host': '46.121.44.392',
    \   'database': 'sampledb2'
    \}
\}

