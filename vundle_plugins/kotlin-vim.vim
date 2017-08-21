" https://github.com/udalov/kotlin-vim
if exists('g:vundle_installing_plugins')
  Plugin 'udalov/kotlin-vim'
  finish
endif

let g:syntastic_kotlin_checkers = ['kotlinc']
