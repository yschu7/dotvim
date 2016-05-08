if exists('g:vundle_installing_plugins')
  Plugin 'Shougo/unite.vim'
  Plugin 'Shougo/neomru.vim'
  finish
endif

" From : https://github.com/bootleq/vimrc_human/blob/500f59e1720bf1c20198ed9ac7510d4bbc97d855/.vimrc#L808-923
nnoremap [unite] <Nop>
xnoremap [unite] <Nop>
nmap <Leader>f [unite]
xmap <Leader>f [unite]
imap <Leader>f <C-\><C-N>[unite]
imap <Leader>c <Plug>(neocomplcache_start_unite_complete)

nnoremap [unite]S :<C-U>Unite source<CR>
nnoremap <silent> [unite]f :<C-U>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]F :<C-U>UniteWithBufferDir -buffer-name=files file_rec<CR>
nnoremap <silent> [unite]r :<C-U>Unite -profile-name=mru file_mru<CR>
nnoremap <silent> [unite]d :<C-U>Unite -profile-name=mru directory_mru<CR>
nnoremap <silent> [unite]p :<C-U>Unite -buffer-name=registers -start-insert register<CR>
xnoremap <silent> [unite]p "_d:<C-U>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]b :<C-U>Unite bookmark<CR>
" TODO use vim-tabline
nnoremap <silent> [unite]g :<C-U>Unite -start-insert tab<CR>
nnoremap <silent> [unite]j :<C-U>Unite jump<CR>
nnoremap <silent> [unite]c :<C-U>Unite change<CR>

let g:unite_update_time = 240
let g:unite_enable_split_vertically = 1
let g:unite_source_file_mru_limit = 140
let g:unite_source_file_mru_time_format = "%m/%d %T "
let g:unite_source_directory_mru_limit = 80
let g:unite_source_directory_mru_time_format = "%m/%d %T "
let g:unite_source_file_rec_max_depth = 5

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_limit = 40

let s:rtp = "~/.vim"
let g:unite_data_directory = expand(s:rtp . '/.unite/')
let g:unite_source_session_path = expand('~/.vim/session/')

call unite#custom_source('file,buffer,file_rec', 'matchers', 'matcher_fuzzy')

call unite#set_profile('files', 'context', {
      \   'start_insert': 1,
      \   'hide_source_names': 1
      \ })

" Ref: thinca - http://d.hatena.ne.jp/thinca/20101027/1288190498
call unite#custom#substitute('source/file', '\$\w\+', '\=eval(submatch(0))', 200)

call unite#set_profile('mru', 'context', {
      \   'start_insert': 1,
      \   'hide_source_names': 1
      \ })


