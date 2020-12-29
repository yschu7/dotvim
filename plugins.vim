" Source all the plugin configuration files.
for file in split(glob('~/.vim/plugcfg/*.vim'), '\n')
  exe 'source' file
endfor
