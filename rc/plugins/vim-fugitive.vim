autocmd QuickFixCmdPost *grep* cwindow
map gg  :exe ":Ggrep " expand("<cword>")<CR>
