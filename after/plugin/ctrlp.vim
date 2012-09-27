nmap <Leader>d :CtrlP<CR>
" dir, rtscript, line look interesting
let g:ctrlp_extensions = ['tag']

"ignore files in ctrl-p
set wildignore +=*/vendor/*,*/bundle/*,*/node_modules/*,*/classes/*,*/target/*,*.jar
