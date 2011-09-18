" from https://github.com/scrooloose/snipmate-snippets
function! Snippet_RubyClassNameFromFilename(...)
    let name = expand("%:t:r")
    if len(name) == 0
        if a:0 == 0
            let name = 'MyClass'
        else
            let name = a:1
        endif
    endif
    return Snippet_Camelcase(substitute(name, '_spec$', '', ''))
endfunction

function! Snippet_Camelcase(s)
    "upcase the first letter
    let toReturn = substitute(a:s, '^\(.\)', '\=toupper(submatch(1))', '')
    "turn all '_x' into 'X'
    return substitute(toReturn, '_\(.\)', '\=toupper(submatch(1))', 'g')
endfunction
