"show window for grep
autocmd QuickFixCmdPost *grep* cwindow

"git shortcuts
map <leader>gt :Gstatus<CR>

"delete fugitive buffers when we leave them to avoid buffer pollution
autocmd BufReadPost fugitive://*,*.fugitiveblame set bufhidden=delete
