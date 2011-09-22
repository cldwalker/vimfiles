" only load this file once
let g:autocmd_ruby_loaded=1

" open yard doc for method
map <Leader>rh :exe "new <BAR> %!yri" expand("<cword>")<CR>

" fold methods
set foldmethod=syntax
set foldlevel=2

" tweak keyword def for *, #
set iskeyword+=63 " allow ?
set iskeyword+=33 " allow !

" search for instance/class method under cursor
map <Leader>gd  :exe ":GitGrep " expand("'-e def <cword>(' --or -e 'def self.<cword>('")<CR>
