let &runtimepath .= ',' .expand( "<sfile>:p:h:h:h" )
set completefunc=attest#CompleteSimple
set shortmess+=c

nnoremap <buffer> <localleader>bl iabc<esc>
