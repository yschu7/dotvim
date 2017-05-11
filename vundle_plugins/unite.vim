" ---------
" unite.vim
" ---------
" only for vim version 7.xx
if has('nvim') || v:version >= 800
  finish
endif

" https://github.com/Shougo/unite.vim
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

nnoremap <silent> [unite]S :<C-U>Unite source<CR>
nnoremap <silent> [unite]f :<C-U>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]F :<C-U>UniteWithBufferDir -buffer-name=files file_rec<CR>
nnoremap <silent> [unite]u :<C-U>Unite -profile-name=mru file_mru<CR>
nnoremap <silent> [unite]d :<C-U>Unite -profile-name=mru directory_mru<CR>
nnoremap <silent> [unite]p :<C-U>Unite -buffer-name=registers -start-insert register<CR>
" nnoremap <silent> [unite]b :<C-U>Unite bookmark<CR>
nnoremap <silent> [unite]b :<C-U>Unite buffer<CR>
nnoremap <silent> [unite]t :<C-U>Unite -start-insert tab<CR>
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

let g:unite_data_directory = g:dotvim_dir . '/.unite/'
let g:unite_source_session_path = g:dotvim_dir . '/session/'

function! s:unite_settings()
  nmap <buffer> <C-J> <Plug>(unite_loop_cursor_down)10j
  nmap <buffer> <C-K> <Plug>(unite_loop_cursor_up)10k
  imap <buffer> <C-J> <Plug>(unite_insert_leave)<C-J>
  imap <buffer> <C-K> <Plug>(unite_insert_leave)<C-K>
  nmap <buffer> <F5> <Plug>(unite_redraw)
  imap <buffer> <F5> <Plug>(unite_redraw)
  nmap <buffer> <C-U> <Plug>(unite_append_end)<Plug>(unite_delete_backward_line)
  nmap <buffer> <LocalLeader>q <Plug>(unite_exit)
  imap <buffer> <LocalLeader>q <Plug>(unite_exit)
  nmap <buffer> <LocalLeader>Q <Plug>(unite_all_exit)
  imap <buffer> <LocalLeader>Q <C-\><C-N><Plug>(unite_all_exit)

  imap <buffer> <LocalLeader><BS> <Plug>(unite_delete_backward_path)
  imap <buffer> ; <Plug>(unite_delete_backward_word)
  inoremap <buffer><expr> <LocalLeader>/ unite#do_action('narrow')

  let unite = unite#get_current_unite()
  if index(unite.source_names, 'file') > -1 || index(unite.source_names, 'file_mru') > -1
    nnoremap <silent><buffer><expr> <LocalLeader><CR> unite#do_action('open')
    inoremap <silent><buffer><expr> <LocalLeader><CR> unite#do_action('open')
  endif
  if index(unite.source_names, 'file_rec') > -1
    imap <buffer> <LocalLeader>. <Plug>(unite_redraw)
  else
    inoremap <buffer> <LocalLeader>.  **/
  endif
endfunction

augroup unite_augrp
  autocmd!
  autocmd FileType unite call s:unite_settings()
augroup END

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


