let &runtimepath .= ',' .expand( "<sfile>:p:h:h:h" )
let maplocalleader = ','
set shortmess+=c

nnoremap <buffer> <localleader>op :call shuffle#OrderParams( 0, 0 )<CR>
