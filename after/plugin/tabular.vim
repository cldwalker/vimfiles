" align cucumber table
map <Leader>ta :Tabularize /\|<CR>
" align 1.9 hashes
map <Leader>th :Tabularize /:\zs<CR>
" align variable assignments
map <Leader>t= :Tabularize assignment<CR>
map <Leader>tz :Tabularize 

AddTabularPattern!  symbols  /:[A-Za-z0-9_-]\+/
map <Leader>t: :Tabularize symbols<CR>

AddTabularPattern!  hash  /=>/
map <Leader>t> :Tabularize hash<CR>
