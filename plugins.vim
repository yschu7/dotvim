" Source all the plugin configuration files.
for file in split(glob('~/.dotvim/plugcfg/*.vim'), '\n')
  exe 'source' file
endfor
