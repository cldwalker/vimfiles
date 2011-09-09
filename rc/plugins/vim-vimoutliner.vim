map tv :!vo_maketags.pl %<CR>
map ts  :stj _tag_
"access any tag from anywhere in outline by typing its name (don't forget autocomplete)
map ta  :ta _tag_
map ,. :source ~/.vim/plugins/vim-vimoutliner/ftplugin/vo_base.vim<CR>

"following is outline related but not dependant on vimoutliner
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

"moves down to the next node with same indent level,
"note: it times out if there are no further nodes to go down to, press C-c to break out
map -j :call Omove("j") <CR>
"moves up to the next node with same indent level
map -k :call Omove("k") <CR>
"use this to fix lines that have an incorrect foldlevel
map -f O <C-[> k dd
"delete current node and unindent the following node and its children
map -sw  dd v ]z <<
