" from scrooloose/vimfiles
" jump to last cursor position when opening a file
" dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

" spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

" Source .vimrc after saving
autocmd bufwritepost .vimrc source $MYVIMRC

" Autoload ruby.vim once if ruby
autocmd FileType ruby call AutoCmdRubyOnce()
function! AutoCmdRubyOnce()
  if !exists('g:autocmd_ruby_loaded')
    source ~/.vim/rc/autoload/ruby.vim
  endif
endfunction

" from wuputah/dotfiles
" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
  if exists("b:stripWhitespace") && b:stripWhitespace == 1 && g:stripWhitespace == 1
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
  endif
endfunction
autocmd FileType ruby,eruby,javascript,css,html,markdown,textile let b:stripWhitespace = 1
autocmd BufWritePre * call StripTrailingWhitespace()
" Allow turning off stripping globally i.e. for certain open source projects
let g:stripWhitespace=1

" Detect files
" recognize more ruby
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    setf ruby
" add json syntax highlighting
autocmd BufNewFile,BufRead *.json setf javascript
autocmd BufNewFile,BufRead *.txt  setf text
autocmd BufNewFile,BufRead *.haml setf haml
autocmd BufNewFile,BufRead *.sass setf sass
autocmd BufNewFile,BufRead *.scss setf scss
