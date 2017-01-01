" https://github.com/machakann/vim-textobj-delimited
if exists('g:vundle_installing_plugins')
  Plugin 'machakann/vim-textobj-delimited'
  finish
endif

" This textobject provides the keymappings to select a part of a delimited string.
" id, ad, iD, aD is used in default.

" These keymappings respond to the words delimited by _, #, - and capital
" characters in default.
" You can define your rule by |g:textobj_delimited_patterns|.

" Please see following examples and (doc/textobj-delimited.txt)[https://github.com/machakann/vim-textobj-delimited/blob/master/doc/textobj-delimited.txt]

