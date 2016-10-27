" Vim global plugin for automating response to swapfiles
" Maintainer:	Damian Conway
" License:	This file is placed in the public domain.

" If already loaded, we're done...
if exists("loaded_autoswap_mac")
    finish
endif
let loaded_autoswap_mac = 1

" Preserve external compatibility options, then enable full vim compatibility...
let s:save_cpo = &cpo
set cpo&vim

" Invoke the behaviour whenever a swapfile is detected...
"
augroup AutoSwap_Mac
    autocmd!
    autocmd SwapExists *  call AS_M_HandleSwapfile(expand('<afile>:p'))
augroup END


" The automatic behaviour...
"
function! AS_M_HandleSwapfile (filename)

    " if swapfile is older han file itself, just get rid of it...
    if getftime(v:swapname) < getftime(a:filename)
        call AS_M_DelayedMsg("Old swapfile detected...and deleted")
        call delete(v:swapname)
        let v:swapchoice = 'e'

    " Otherwise, open file read-only...
    else
        call AS_M_DelayedMsg("Swapfile detected...opening read-only")
        let v:swapchoice = 'o'
    endif
endfunction


" Print a message after the autocommand completes
" (so you can see it, but don't have to hit <ENTER> to continue)...
"
function! AS_M_DelayedMsg (msg)
    " A sneaky way of injecting a message when swapping into the new buffer...
    augroup AutoSwap_Mac_Msg
        autocmd!
        " Print the message on finally entering the buffer...
        autocmd BufWinEnter *  echohl WarningMsg
  exec 'autocmd BufWinEnter *  echon "\r'.printf("%-60s", a:msg).'"'
        autocmd BufWinEnter *  echohl NONE

        " And then remove these autocmds, so it's a "one-shot" deal...
        autocmd BufWinEnter *  augroup AutoSwap_Mac_Msg
        autocmd BufWinEnter *  autocmd!
        autocmd BufWinEnter *  augroup END
    augroup END
endfunction

" Restore previous external compatibility options
let &cpo = s:save_cpo
