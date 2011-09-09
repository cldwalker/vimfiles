autocmd QuickFixCmdPost *grep* cwindow
map gg  :exe ":Ggrep " expand("<cword>")<CR>

"delete fugitive buffers when we leave them to avoid buffer pollution
autocmd BufReadPost fugitive://*,*.fugitiveblame set bufhidden=delete
