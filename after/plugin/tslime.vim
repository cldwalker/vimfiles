"from https://github.com/jgdavey/tslime.vim

function! s:first_readable_file(files) abort
  let files = type(a:files) == type([]) ? copy(a:files) : split(a:files,"\n")
  for file in files
    if filereadable(rails#app().path(file))
      return file
    endif
  endfor
  return ''
endfunction

function! s:prefix_for_test(file)
  if a:file =~# '_spec.rb$'
    return "rspec "
  elseif a:file =~# '_test.rb$'
    return exists('g:tslime_cmd') ? g:tslime_cmd . ' ' : "ruby -Itest "
  endif
  return ''
endfunction

function! s:SendAlternateToTmux(suffix) abort
  let current_file = expand("%")
  let executable = ""
  if s:prefix_for_test(current_file) != ''
    let executable = s:prefix_for_test(current_file) . current_file . a:suffix
  elseif current_file =~# '.feature$'
    let executable = "cucumber " . current_file . a:suffix
  elseif exists('g:autoloaded_rails')
    let related_file = s:first_readable_file(rails#buffer().related())
    if related_file =~# '.rb$'
      let executable = s:prefix_for_test(related_file) . related_file
    endif
  endif
  if executable == ""
    let executable = "!!"
  endif
  return Send_to_Tmux("".executable."\n")
endfunction

nnoremap <leader>rt :w \| :call <SID>SendAlternateToTmux("")<CR>
nnoremap <leader>rl :let g:tslime_cmd='rspec' \| :w \| :call <SID>SendAlternateToTmux(":".line('.'))<CR>
nnoremap <leader>re :call Send_to_Tmux(getline('.') . "\n")<CR>
vmap <leader>rs "ry :call Send_to_Tmux(@r)<CR>
