"TODO: use general function for snippets?
function! Insert(value)
  let @y = a:value
  normal! ^"yP
endfunction

"load console menu
fu! Consolemenu()
  so $VIMRUNTIME/menu.vim
  set wildmenu
  set cpo-=<
  set wildmode=full
  set wcm=<C-Z>
endf

"Wraps selection with given tag name
fu! TagSelection()
  let l:tag = input("Tag name? ")
  " Strip off all but the first work in the tag for the end tag
  exec "normal `>a</" . substitute( l:tag, '[ \t"]*\(\<\w*\>\).*', '\1>\e', "" )
  exec "normal `<i"  substitute( l:tag, '[ \t"]*\(\<.*\)', '<\1>\e', "" )
endf	
map wt  :call TagSelection()<CR>
