" ------------------------------------------
" https://github.com/vim-airline/vim-airline
" ------------------------------------------

" https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#enabled = 0
" let g:airline_mode_map = {
"       \ 'n'  : 'N',
"       \ 'i'  : 'I',
"       \ 'R'  : 'R',
"       \ 'v'  : 'V',
"       \ 'V'  : 'VL',
"       \ 'c'  : 'CMD',
"       \ '' : 'VB',
"       \ }
" Show the current working directory folder name
let g:airline_section_b = '%{substitute(getcwd(), ".*\/", "", "g")} '
" Just show the file name
let g:airline_section_c = '%t'
"let g:airline_section_y = ''
"let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#:%3v'
"let g:airline_section_z = '%3p%% %{substitute(line("."), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}|%{substitute(line("$"), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}'
let g:airline_section_z = '%3p%% %4l%\:%3v'

"Smarter tab line
let g:airline#extensions#tabline#enabled = 1

