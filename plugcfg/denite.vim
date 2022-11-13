" ----------
" denite.vim
" ----------

" For neovim and vim version 8
if ! has('nvim') && v:version < 800
  finish
endif

nnoremap [denite] <Nop>
xnoremap [denite] <Nop>
nmap <Leader>f [denite]
xmap <Leader>f [denite]
imap <Leader>f <C-\><C-N>[denite]

nnoremap <silent> [denite]f :<C-U>Denite file<CR>
nnoremap <silent> [denite]F :<C-U>Denite file/rec<CR>
nnoremap <silent> [denite]u :<C-U>Denite file_mru<CR>
nnoremap <silent> [denite]r :<C-U>Denite -resume<CR>
nnoremap <silent> [denite]p :<C-U>Denite -buffer-name=registers register<CR>
nnoremap <silent> [denite]b :<C-U>Denite buffer<CR>
nnoremap <silent> [denite]g :<C-U>DeniteCursorWord grep<CR>

call denite#custom#source('file_rec', 'matchers', ['mather_fuzzy'])

" Use existing map to define a custom map
call denite#custom#map('normal', '<C-k>', '<C-b>')
call denite#custom#map('normal', '<C-j>', '<C-f>')

" Change file/rec command.
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

" Ripgrep command on grep source
call denite#custom#var('grep', {
  \ 'command': ['rg'],
  \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
  \ 'recursive_opts': [],
  \ 'pattern_opt': ['--regexp'],
  \ 'separator': ['--'],
  \ 'final_opts': [],
  \ })

" Change default prompt
call denite#custom#option('default', 'prompt', '>')

