" only load this file once
let g:autocmd_ruby_loaded=1

" open yard doc for method
map <Leader>rh :exe "new <BAR> %!yri" expand("<cword>")<CR>

" fold methods
set foldmethod=syntax
set foldlevel=2
