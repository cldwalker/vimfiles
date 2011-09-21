nmap <Leader>d :CommandT<CR>
nmap <Leader>tf :CommandTFlush<CR>:CommandT<CR>
nmap <Leader>tb :CommandTBuffer<CR>

let g:CommandTMatchWindowReverse=1            " keep current choice fixed
let g:CommandTAcceptSelectionSplitMap='<C-d>' " defaults weren't working
let g:CommandTCursorStartMap='<C-b>'          " consistent with other maps
let g:CommandTMaxHeight=20
