"insert + command mode
inoremap <C-B> <Home>
inoremap <C-E> <End>
noremap! <C-H> <Left>
noremap! <C-L> <Right>
noremap! <C-G> <S-Left>
noremap! <C-T> <S-Right>
inoremap <C-J> <Down>
inoremap <C-K> <Up>

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
map <C-I>t :ts /_t_*/
map <C-I>w :s/\s\+$//
map <C-I>v :s/^\(\t*\)/\1\[%#/ <CR> <BAR> :s/$/%\]/<CR><BAR>:noh<CR>
map <C-I>f :s/^\(\s\+\)\[%#/\1/ <CR> <BAR> :s/%\]$//<CR><BAR>:noh<CR>
map <C-I>c :s/^\(\s*\)/\1#/ <CR> <BAR>:noh<CR>
"prepends each line with # and preserves indents,useful for programming
map <C-I>d :s/^\(\s\+\)#/\1/ <CR> <BAR>:noh<CR>
"undoes the above, useful for programming

"alt
"mneumonics:t-tag,l-link,o-option,b-buffer,p-perl,a-admin,w-web,m-misc
map b  :buffers <CR>
map cx  :new <BAR> exe " %!g++ -o " . substitute (@#,"\.cpp","",'')." #"<CR>
"map cx  :let arg = inputdialog("Arguments?: ","") <BAR> :!g++ -o a.out # <BAR> exe "new <BAR> %! ./# ".arg <CR>
map mm :emenu <C-Z>
map cw :new <BAR>r!
"get output of a shell command in new window
map io :call Tabp() <CR>
"increases the indent by a space
map iu :call Tabm() <CR>
"decreases the indent by a space
map ta  :ta _tag_
"access any tag from anywhere in outline by typing its name (don't forget autocomplete)
map ts  :stj _tag_
map tj  :exe ":ta " expand("<cword>")<CR>
map tm :!/usr/share/vim/vim62/tools/pltags.pl %<CR>
map tv :!vo_maketags.pl %<CR>
map l  :exe "normal v$hy" <BAR> exe "/".@" <CR>
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
map oh  :noh <CR>
map ,    :set imi=0<CR>
map .    :set imi=1<CR>
map z  :!perldoc -t <cword> <BAR>festival --tts<CR>
map a  [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
"map a  :!festival --tts <cword> <CR>
map pt  :Tabber
"this indents a range of lines by the indent number you provide
"u can highlight a range of lines and with this set them to the same indent
map pp  :call Smartpaste()<CR>
map pf  :exe "new <BAR> %!perldoc -U -f ". expand("<cword>")<CR>
map po  :exe "new <BAR> %!perldoc -U " expand("<cword>")<CR>
map px  :let arg = inputdialog("Arguments?: ","") <BAR> exe "new <BAR> %! ./"."# ". arg <CR>
"map px  :let arg = inputdialog("Arguments?: ","") <BAR> exe "new <BAR> %! # ". arg <CR>
map s  :w<CR>
map ac  :lcd %:p:h <CR>
map am  :!chmod +x %<CR>
map h  yaw :exe "h ".@" <CR>
map wt  :call TagSelection()<CR>
map wh  :!lynx http://www.willcam.com/cmat/html/crossref.html<CR>
map wp  :set path+=/home/bozo/docs/work/shim/tmpl/src,/home/bozo/docs/work/shim/tmpl/lib<CR>
map wo  :set path=,.,,/home/bozo/docs/work/shim/tmpl/mysrc,/home/bozo/docs/work/shim/tmpl/mylib<CR>
"map wh  :exe "!echo /". expand("<cword>")." >  ~/bin/temp/lynx.tmp" <BAR> :!lynx -cmd_script="~/bin/temp/lynx.tmp" http://www.willcam.com/cmat/html/crossref.html<CR>
"map   ,. :source $HOME/.vimoutliner/outliner.vim<CR>
map   ,. :source $HOME/.vim/ftplugin/vo_base.vim<CR>
"otl
map -j :call Omove("j") <CR>
"moves down to the next node with same indent level,
"note: it times out if there are no further nodes to go down to, press C-c to break out
map -k :call Omove("k") <CR>
"moves up to the next node with same indent level
map -f O <C-[> k dd
"use this to fix lines that have an incorrect foldlevel
map -sw  dd v ]z <<
"delete current node and unindent the following node and its children
map  -e v ]z zo
"local folding: expands children of cursor node by one level
"map qr F, v f, h d f, h p "have to go back to first column for 1st item
" map ql f, v F, l
" m,t,i,y,j,h
