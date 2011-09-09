"make Y consistent with C and D
nnoremap Y y$

"insert + command mode
inoremap <C-B> <Home>
inoremap <C-E> <End>
noremap! <C-H> <Left>
noremap! <C-L> <Right>
noremap! <C-G> <S-Left>
noremap! <C-T> <S-Right>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
"Insert directory of current file
cmap <C-Y> <C-R>=expand("%:p:h") . "/" <CR>

"windows
noremap <C-J> <C-W>_
noremap <C-M> <C-W>=
noremap x  :q<CR>
noremap q :q!<CR>
"can put same safeguard of C-w w + :bn in order to create #
"disabled b/c too easily mistyped
"map j <C-W>j
"map k <C-W>k

"regexp
"prepends each line with # and preserves indents,useful for programming
map <C-I>c :s/^\(\s*\)/\1#/ <CR> <BAR>:noh<CR>
"undoes the above, useful for programming
map <C-I>d :s/^\(\s\+\)#/\1/ <CR> <BAR>:noh<CR>

"=alt keys=
"mneumonics:t-tag,o-option,a-admin

"misc
map b  :buffers <CR>
map tm :!ctags -R<CR>
"search for text between current position and end of line
map l  :exe "normal v$hy" <BAR> exe "/".@" <CR>
"save file
map s  :w<CR>
":help for current word
map h  yaw :exe "h ".@" <CR>
"alternate way to exit insert mode
map ,    :set imi=1<CR>
"menu of file locations for current word, pick one to go to it
map a  [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

"options
map on  :set invnumber <CR>
map om  :set invmagic <CR>
map oa  :set invautowrite <CR>
map oc  :set invignorecase <CR>
map oi  :set invincsearch <CR>
map ol  :set invlist <CR>
map of  :set foldmethod=expr <CR>
map ow  :set invwildmenu <CR>
map or  :set invwrap <CR>
map ob  :set invswitchbuf <CR>

"turn off highlightning
map oh  :nohls <CR>
nnoremap <C-L> :nohls<CR><C-L>

"shell cmds
"cd to current file's directory
map ac  :lcd %:p:h <CR>
map am  :!chmod +x %<CR>
"display shell command result in new window
map aw :new <BAR>r!
"execute current file with given arguments + put result in new buffer
map px  :let arg = inputdialog("Arguments?: ","") <BAR> exe "new <BAR> %! ./"."# ". arg <CR>

" Opens an edit command with the directory of the current edited file filled in
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
