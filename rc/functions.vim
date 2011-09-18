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
