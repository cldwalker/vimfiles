"show window for grep
autocmd QuickFixCmdPost *grep* cwindow

"git shortcuts
map <Leader>gg  :Ggrep 
map <Leader>gw  :exe ":Ggrep " expand("<cword>")<CR>
map <Leader>gd  :exe ":Ggrep " expand("'def <cword>'")<CR>
map <leader>gt :Gstatus<CR>

"delete fugitive buffers when we leave them to avoid buffer pollution
autocmd BufReadPost fugitive://*,*.fugitiveblame set bufhidden=delete
