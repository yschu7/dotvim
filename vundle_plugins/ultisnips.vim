" https://github.com/sirver/ultisnips
if exists('g:vundle_installing_plugins')
  Plugin 'SirVer/ultisnips'
  finish
endif

let g:UltiSnipsSnippetsDir="~/.vim/MyUltiSnips"
let g:UltiSnipsSnippetDirectories=["MyUltiSnips"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
