scriptencoding utf-8

echom "Shuffle - Autoloading... "

let s:pattern = '[^a-zA-Z0-9_"''$=]\+'

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

    let tmp_string = @@
    execute "normal! " . column . "|"
    execute "normal! vi)y"
    execute "normal! \<esc>"
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

    let s:glue = a:fold ? ', ' : ',\r'
    let s:newline = a:fold ? '' : '\r'
    let joined_string = join( list_items, s:glue )

    try
        execute 's/'. selected_string . '/'. s:newline . joined_string . s:newline
    catch
        return
    endtry
    
    if !a:fold
        execute "normal! vi)="
    endif
endfunction

" desc: Check valid argument point
" note : Find motion may cause extra works
" return : bool
function! s:FlaskPoint()
    return match( getline( '.' ), '(' )
endfunction
