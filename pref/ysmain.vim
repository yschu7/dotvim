" ===========================
"   ysmain.vim : load files
" ===========================
" Source file
func! Source_file(dirname, fname)
  let fn = a:dirname . a:fname
  execute ':source ' . fn
endf

" Files to load
let c_eval   = 'eval.vim'
let c_setcol = 'setcolors.vim'
let c_tetris = 'tetris.vim'
let c_yankm  = 'yankmatches.vim'
let c_autos  = 'autoswap.vim'
let c_vmath  = 'vmath.vim'
let c_dragv  = 'dragvisuals.vim'
let c_dbext  = 'dbextlnx.vim'
let c_dbextw = 'dbextwin.vim'

" g:w32_dir, g:lnx_dir : global var defined in ~/.vim/yscust.vim
if has('win32')
  let call_list = ['win32.vim', c_eval, c_setcol, c_tetris, c_yankm, c_autos, c_vmath, c_dragv, c_dbextw]
  for vimfile in call_list
    call Source_file(g:w32_dir, vimfile)
  endfor
elseif has('mac')
  let call_list = [c_eval, c_setcol, c_tetris, c_yankm, c_autos, c_vmath, c_dragv, c_dbext]
  for vimfile in call_list
    call Source_file(g:lnx_dir, vimfile)
  endfor
else
  let call_list = [c_eval, c_setcol, c_tetris, c_yankm, c_autos, c_vmath, c_dragv, c_dbext]
  for vimfile in call_list
    call Source_file(g:lnx_dir, vimfile)
  endfor
endif

