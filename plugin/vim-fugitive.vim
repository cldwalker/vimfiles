"show window for grep
autocmd QuickFixCmdPost *grep* cwindow

"git shortcuts
map <Leader>gg  :exe ":Ggrep " expand("<cword>")<CR>
map <Leader>gd  :exe ":Ggrep " expand("'def <cword>'")<CR>
map <leader>gs :Gstatus<CR>

"delete fugitive buffers when we leave them to avoid buffer pollution
autocmd BufReadPost fugitive://*,*.fugitiveblame set bufhidden=delete
