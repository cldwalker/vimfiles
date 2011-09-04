"load plugin-specific files in ~/.vim/rc/plugins/
for file in split(glob('~/.vim/plugins/*'),"\n")
  let plugin = substitute(system('basename -a ' . file), '\n', '', '')
  let pluginfile= expand('~/.vim/rc/plugins/') . plugin . '.vim'
  if filereadable(pluginfile)
    exe 'source ' . pluginfile
  endif
endfor
