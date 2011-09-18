" Search snipmate snippets by current filetype
function! GrepSnippets(query)
  execute "Ggrep" a:query "plugin/snipmate/" . &filetype . "*"
endfunction
command! -nargs=1 GrepSnippets :call GrepSnippets('<args>')

map <Leader>gs :GrepSnippets 
