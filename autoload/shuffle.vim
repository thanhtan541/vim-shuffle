scriptencoding utf-8

echom "Shuffle - Autoloading... "

let s:pattern = '[^a-zA-Z0-9_"''$=]\+'
let s:glue = ', '

" desc: Shuffle params into better presentation
" a:type -> str
" a:revert -> bool = 1|0
function! shuffle#OrderParams() abort
    if getline ( '.' ) == ''
        return 0
    endif

    let check_point = s:FlaskPoint()
    echo 
    if check_point == -1
        return 0
    else
        let column = check_point + 1
    endif

    execute "normal! " . column . "|"
    normal! vi)y
    let list_items = split( @@, s:pattern )
    if len( list_items ) <= 1
        return 0
    endif

    let reversed_items = reverse( list_items )
    let @@ = join( reversed_items, s:glue )
    normal! gvp
endfunction

" desc: Check valid argument point
" note : Find motion may cause extra works
" return : bool
function! s:FlaskPoint()
    return match( getline( '.' ), '(' )
endfunction
