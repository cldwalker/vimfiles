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

" wraps highlighted block with end and puts cursor at top
map <Leader>re >'>o<BS>end<Esc>'<O

" convert 1.8 hash to 1.9
command! -bar -range=% NotRocket :<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/ge
