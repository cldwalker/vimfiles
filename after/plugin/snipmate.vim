" Search snipmate snippets, by current filetype if possible
function! GrepSnippets(query)
  let l:dir = "~/.vim/snippets"
  " if directory by current filetype
  if globpath('~/.vim/snippets', &filetype . "*") != ''
    let l:dir = "~/.vim/snippets/" . &filetype . "*"
  endif

  execute "Grep" a:query l:dir
endfunction
command! -nargs=1 GrepSnippets :call GrepSnippets('<args>')

map <Leader>gs :GrepSnippets 
