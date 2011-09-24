"load console menu
fu! Consolemenu()
  so $VIMRUNTIME/menu.vim
  set wildmenu
  set cpo-=<
  set wildmode=full
  set wcm=<C-Z>
endf

" Open URL - from ryanb/dotfiles
command! -bar -nargs=1 OpenURL :!open <args>
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
function! StripTrailingWhiteSpace()
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

" slimmer version of github.com/mileszs/ack.vim
function! Ack(args)
  let grepprg_bak=&grepprg
  exec "set grepprg=ack\\ -H\\ --nogroup\\ --nocolor"
  execute "silent! grep " . a:args
  botright copen
  let &grepprg=grepprg_bak
  exec "redraw!"
endfunction
command! -nargs=* -complete=file Ack call Ack(<q-args>)

" from github.com/tjennings/git-grep-vim
function! GitGrep(args)
  let grepprg_bak=&grepprg
  exec "set grepprg=git\\ grep\\ -n"
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
map <Leader>f   :Ack 
map <Leader>gr  :Grep 
map <Leader>gg  :GitGrep 
map <Leader>gw  :exe ":GitGrep " expand("<cword>")<CR>

command! -nargs=* -complete=file GrepPlugins call Grep(<q-args> . ' ~/.vim/plugins')
map <Leader>gp  :GrepPlugins 

" Search my keybindings
command! -nargs=1 GrepKeys :cd ~/.vim | :GitGrep '^[a-z]*map.*<args>' | :cd -
map <Leader>gk :GrepKeys 

" Search my vim repo
command! -nargs=* GrepVim :cd ~/.vim | :GitGrep <q-args> | :cd -
map <Leader>gv :GrepVim 
