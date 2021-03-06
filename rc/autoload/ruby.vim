" only load this file once
let g:autocmd_ruby_loaded=1

" open yard doc for method
map <Leader>rh :exe "new <BAR> %!yri" expand("<cword>")<CR>

" fold methods
function! b:ToggleRubyFolding()
  if &foldmethod != 'syntax'
    set foldmethod=syntax
    set foldlevel=2
  else
    set foldmethod=manual
    set foldlevel=1000 "open all folds
  endif
endfunction
map <Leader>rf :call b:ToggleRubyFolding()<CR>

" tweak keyword def for *, #
set iskeyword+=63 " allow ?
set iskeyword+=33 " allow !

" search for instance/class method under cursor
map <Leader>gd  :exe ":GitGrep " expand("'-e def <cword>(' --or -e 'def self.<cword>('")<CR>

" convert 1.8 hash to 1.9
command! -bar -range=% NotRocket :<line1>,<line2>s/:\(\w\+\)\s*=>/\1: /ge
