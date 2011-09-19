" Opens an edit command with the directory of the current edited file filled in
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Quick-open .vimrc
nnoremap <leader>v <C-w><C-v><C-l>:e ~/.vimrc<CR>

" Tab mappings
map <Leader>te :tabedit
map <Leader>tc :tabclose<CR>
map <Leader>to :tabonly<CR>
map <Leader>tn :tabnext<CR>
map <Leader>tp :tabprevious<CR>
map <Leader>tm :tabmove

" movin in buffer list
map <Leader>n  :cn<CR>
map <Leader>p  :cp<CR>

" normal mode
" make Y consistent with C and D
nnoremap Y y$

" insert + command mode
noremap! <C-H> <Left>
noremap! <C-L> <Right>
noremap! <C-G> <S-Left>
noremap! <C-T> <S-Right>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-B> <Home>
inoremap <C-E> <End>
" alternate escape
inoremap jj    <Esc>
" go back to last insert location
inoremap <C-C> <Esc>'^
" reverse command search
cnoremap <C-O> <Up>
" forward command search
cnoremap <C-K> <Down>
" Insert directory of current file
cnoremap <C-Y> <C-R>=expand("%:p:h") . "/" <CR>

" visual mode
" Duplicate a visual selection
vmap D y'>p

" always use 'very magic' mode (i.e. full regexps)
nnoremap / /\v
vnoremap / /\v

" windows
noremap <C-J> <C-W>_
noremap <C-M> <C-W>=
noremap x  :q<CR>
noremap q :q!<CR>
" split navigation
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" execute last command
nnoremap <Leader>c @:

" prepends each line with # and preserves indents,useful for programming
map <C-I>c :s/^\(\s*\)/\1#/ <CR> <BAR>:noh<CR>
" undoes the above, useful for programming
map <C-I>d :s/^\(\s\+\)#/\1/ <CR> <BAR>:noh<CR>

" =alt keys=
" mneumonics:t-tag,o-option,a-admin

" misc
map b  :buffers <CR>
map <Leader>tt :!ctags -R --exclude='*.js'<CR>
map <Leader>tj :exe ":tselect /^".expand("<cword>")<CR>
" search for text between current position and end of line
map l  :exe "normal v$hy" <BAR> exe "/".@" <CR>
" save file
map s  :w<CR>
" :help for current word
map h  yaw :exe "h ".@" <CR>
" alternate way to exit insert mode
map <Leader>,    :set imi=1<CR>
" menu of file locations for current word, pick one to go to it
map a  [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" toggle options
set pastetoggle=ot
map on  :set invnumber <CR>
map oa  :set invautowrite <CR>
map ol  :set invlist <CR>

" turn off highlightning
map oh  :nohls <CR>
nnoremap <C-L> :nohls<CR><C-L>

" shell cmds
" cd to current file's directory
map ac  :lcd %:p:h <CR>
map am  :!chmod +x %<CR>
" display shell command result in new window
map aw :new <BAR>r!
" execute current file with given arguments + put result in new buffer
map ax  :let arg = inputdialog("Arguments?: ","") <BAR> exe "new <BAR> %! ./"."# ". arg <CR>
