" https://github.com/christoomey/vim-sort-motion
if exists('g:vundle_installing_plugins')
  Plugin 'christoomey/vim-sort-motion'
  finish
endif

" The primary interface to this plugin is via the gs mapping, for sorting
" based on a text object or motion.
" To use the mapping, type gs followed by a motion, ie 2j to sort down two lines.
"
" Examples:
" --------
" gs2j => Sort down two lines (current + 2 below)
" gsip => Sort the current paragraph
"
" gsi( => Sort within parenthesis. (b, c, a) would become (a, b, c)

" Configuration: pass any options to sort, you can set g:sort_motion_flags
" To make all sorts case insensitive and remove duplicates.
" let g:sort_motion_flags = "ui"
