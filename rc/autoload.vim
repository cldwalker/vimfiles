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

" automatically remove trailing whitespace before write
function! ConditionalStripTrailingWhitespace()
  if exists("b:stripWhitespace") && b:stripWhitespace == 1 && g:stripWhitespace == 1
    call StripTrailingWhiteSpace()
  end
endfunction

autocmd FileType ruby,eruby,javascript,css,html,markdown,textile let b:stripWhitespace = 1
autocmd BufWritePre * call ConditionalStripTrailingWhitespace()
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
