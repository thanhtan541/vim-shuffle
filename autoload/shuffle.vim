scriptencoding utf-8

echom "Shuffle - Autoloading... "

let s:pattern = '[^a-zA-Z0-9_"$=]\+'
let s:glue = ', '

" desc: Shuffle params into better presentation
" a:type -> str
" a:revert -> bool = 1|0
function! shuffle#OrderParams()
    if getline ( '.' ) == ''
        return 1
    endif
    normal! vi)y
    let list_items = split( @@, s:pattern )
    let reversed_items = reverse( list_items )
    let @@ = join( reversed_items, s:glue )
    normal! gvp
endfunction
