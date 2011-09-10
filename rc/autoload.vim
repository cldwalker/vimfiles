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

" Autoload ruby.vim once if ruby
autocmd FileType ruby call AutoCmdRubyOnce()
function! AutoCmdRubyOnce()
  if !exists('g:autocmd_ruby_loaded')
    source ~/.vim/rc/autoload/ruby.vim
  endif
endfunction
