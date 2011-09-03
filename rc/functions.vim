fu! Replacetab(line1,line2,tab)
  exe a:line1.",".a:line2 ."perldo correctlevel('',".a:tab . ");"
endf
function! Omove(in)
  let inum1 = indent(".") / &tabstop
  exe "normal" a:in
  let inum2 = indent(".") / &tabstop
  "echo inum1 inum2
  while inum1 != inum2
    exe "normal" a:in
    let inum2 = indent(".") / &tabstop
    "echo inum1 inum2
  endwhile
endfunction
function! Insert(value)
  let @y = a:value
  normal! ^"yP
endfunction
fu! Join(delim)
  let i = 1
  "numarg = input ("Num? ")
  while i < numarg
    exe "normal Jr".a:delim
    let i = i +1
  endwhile
endf
fu! Consolemenu()
  so $VIMRUNTIME/menu.vim
  set wildmenu
  set cpo-=<
  set wildmode=full
  set wcm=<C-Z>
endf
fu! Tabm()
  let temp = &ts
  let &ts = temp - 1
  let &sw = &ts
endf
fu! Tabp()
  let temp = &ts
  let &ts = temp + 1
  let &sw = &ts
endf
fu! TagSelection()
  let l:tag = input("Tag name? ")
  " Strip off all but the first work in the tag for the end tag
  exec "normal `>a</" . substitute( l:tag, '[ \t"]*\(\<\w*\>\).*', '\1>\e', "" )
  exec "normal `<i"  substitute( l:tag, '[ \t"]*\(\<.*\)', '<\1>\e', "" )
endf	
