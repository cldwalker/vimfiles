"load console menu
fu! Consolemenu()
  so $VIMRUNTIME/menu.vim
  set wildmenu
  set cpo-=<
  set wildmode=full
  set wcm=<C-Z>
endf

" Open URL - from ryanb/dotfiles
command -bar -nargs=1 OpenURL :!open <args>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map <Leader>w :call OpenURL()<CR>

" from wuputah/dotfiles
" remove whitespace
function StripTrailingWhiteSpace()
  " create a mark to return to
  normal mZ
  %s/\s\+$//e   " strip whitespace from end of lines
  %s/\n\+\%$//e " strip extra newlines from EOF
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  " if the mark we created is beyond EOF, go to EOF
  if line("'Z") > line("$")
    normal G
  else
    normal `Z
  endif
endfunction
nnoremap <Leader>s :call StripTrailingWhiteSpace()<CR>

" from github.com/tjennings/git-grep-vim
let g:gitgrepprg="git\\ grep\\ -n"

function! GitGrep(args)
  let grepprg_bak=&grepprg
  exec "set grepprg=" . g:gitgrepprg
  execute "silent! grep " . a:args
  botright copen
  let &grepprg=grepprg_bak
  exec "redraw!"
endfunction
command! -nargs=* -complete=file GitGrep call GitGrep(<q-args>)

function! Grep(args)
  execute "silent! grep -r " . a:args
  botright copen
  exec "redraw!"
endfunction
command! -nargs=* -complete=file Grep call Grep(<q-args>)

"Grep shortcuts
map <Leader>gr  :Grep 
map <Leader>gg  :GitGrep 
map <Leader>gw  :exe ":GitGrep " expand("<cword>")<CR>
map <Leader>gd  :exe ":GitGrep " expand("'def <cword>'")<CR>

" Search my keybindings
command! -nargs=1 GrepKeys :GitGrep '^[a-z]*map.*<args>' after/plugin/*.vim rc
map <Leader>gk :GrepKeys 
