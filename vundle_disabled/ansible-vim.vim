"disable
finish

" https://github.com/pearofducks/ansible-vim
if exists('g:vundle_installing_plugins')
  Plugin 'pearofducks/ansible-vim'
  finish
endif

let g:ansible_unindent_after_newline = 1

let g:ansible_attribute_highlight = "ob"

let g:ansible_name_highlight = 'd'

let g:ansible_extra_keywords_highlight = 1

let g:ansible_normal_keywords_highlight = 'Constant'
