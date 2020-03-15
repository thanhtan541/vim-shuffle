function SetUp()
  let init_script = g:test_path . '/../support/test_async.vim'
  execute 'source ' . init_script
endfunction

function Test_Async_Empty()
  function CheckPopupContents()
    let items = complete_info().items
    call map( items, {index, value -> value.word} )
    call assert_equal( [ 'Jan',
                       \ 'Feb',
                       \ 'Mar',
                       \ 'Apr',
                       \ 'May',
                       \ 'Jun',
                       \ 'Jul',
                       \ 'Aug',
                       \ 'Sep',
                       \ 'Oct',
                       \ 'Nov',
                       \ 'Dec' ],
                      \ items )
    call feedkeys( "\<Esc>", 't' )
  endfunction

  augroup Test_Async
    au CompleteChanged * call CheckPopupContents()
  augroup END

  call feedkeys( "i\<C-x>\<C-u>", 'xt!' )
  call assert_equal( 'Jan', getline( 1 ) )

  augroup Test_Async
    au!
  augroup END

  delfunc! CheckPopupContents
  %bwipe!
endfunction

function Test_Async_February()
  function ExitInsertMode()
    call feedkeys( "\<Esc>" )
  endfunction

  augroup Test_Async
    au CompleteDone * call ExitInsertMode()
  augroup END

  call feedkeys( "iF\<C-x>\<C-u>", 'xt!' )
  call assert_equal( 'Feb', getline( 1 ) )

  augroup Test_Async
    au!
  augroup END

  delfunc! ExitInsertMode
  %bwipe!
endfunction

function Test_Async_March()
  function CheckPopupContents()
    let items = complete_info().items
    call map( items, {index, value -> value.word} )
    call assert_equal( [ 'Mar', 'May' ], items )
    call feedkeys( "\<Esc>" )
  endfunction

  augroup Test_Async
    au CompleteChanged * call CheckPopupContents()
  augroup END

  call feedkeys( "iM\<C-x>\<C-u>", "xt!" )
  call assert_equal( "Mar", getline( 1 ) )

  augroup Test_Async
    au!
  augroup END
  delfunc! CheckPopupContents
  %bwipe!
endfunction

" function! Test_Exit()
"   qa!
" endfunction
