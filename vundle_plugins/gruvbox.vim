" https://github.com/morhetz/gruvbox
if exists('g:vundle_installing_plugins')
  Plugin 'morhetz/gruvbox'
  finish
endif

" https://github.com/morhetz/gruvbox/wiki/Terminal-specific
if has('gui_gnome')
  let g:gruvbox_italic=1
endif
