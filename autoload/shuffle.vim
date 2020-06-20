scriptencoding utf-8

echom "Shuffle - Autoloading... "

let s:pattern = '[^a-zA-Z0-9_"''$=]\+'
let s:glue = ',\r'
let s:newline = ''
let s:trailing = ''

" desc: Shuffle params into better presentation
" a:sort -> 1 | 0
" a:fold -> bool = 1|0
function! shuffle#OrderParams(sort, fold) abort
    if getline ( '.' ) == ''
        return 0
    endif

    let check_point = s:FlaskPoint()
    if check_point == -1
        return 0
    else
        let column = check_point + 1
    endif

    let indent_times = s:MeasureIndentTimes()
    let init_line = line( '.' )
    let tmp_string = @@
    execute "normal! " . column . "|"
    execute "normal! vi)y\<esc>"
    let selected_string = @@
    let @@ = tmp_string
    
    let list_items = split( selected_string, s:pattern )
    let items_len = len( list_items )
    if items_len <= 1
        return 0
    endif

    if a:sort
        call reverse( list_items )
    endif
    if a:fold
        let s:glue = ', '
    else
        let s:newline = '\r'
        let s:trailing = repeat( ' ', indent( '.' ) )
    endif

    let joined_string = join( list_items, s:glue )
    execute 's/'. selected_string . '/'. s:newline . joined_string . s:newline . s:trailing
    if !a:fold
        execute (init_line + 1) . ',' . (init_line + items_len) . repeat( '>', indent_times )
    endif
endfunction

" desc: Check valid argument point
" note : Find motion may cause extra works
" return : bool
function! s:FlaskPoint()
    return match( getline( '.' ), '(' )
endfunction

" desc: Count the indent space of current line
" note : Maybe vary between languages
" return : int
function! s:MeasureIndentTimes()
    let init_indent = indent( '.' )
    return init_indent / &shiftwidth + 1
endfunction
