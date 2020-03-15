function SetUp()
  let init_script = g:test_path . '/../support/test_async.vim'
  execute 'source ' . init_script
endfunction

function Test_Async_Empty()
  call feedkeys( "i\<C-x>\<C-u>", 'xt' )
  call assert_equal( 'Jan', getline( 1 ) )
  %bwipe!
endfunction

function Test_Async_February()
  call feedkeys( "iF\<C-x>\<C-u>", 'xt' )
  call assert_equal( 'Feb', getline( 1 ) )
  %bwipe!
endfunction

function Test_Async_March()
  call feedkeys( "iM\<C-x>\<C-u>", 'xt' )
  call assert_equal( 'Mar', getline( 1 ) )
  %bwipe!
endfunction

function Test_Async_May()
  call feedkeys( "iM\<C-x>\<C-u>\<C-n>", 'xt' )
  call assert_equal( 'May', getline( 1 ) )
  %bwipe!
endfunction

function Test_Popup_Menu_Expression_Register()
  function TestPopupContents()
    let items = complete_info().items
    call map( items, {index, value -> value.word} )
    call assert_equal( [ 'Mar', 'May' ], items )
    return ''
  endfunction

  call feedkeys( "iM\<C-x>\<C-u>\<C-r>=TestPopupContents()\<CR>", "xt" )
  call assert_true( len( complete_info().items ) == 0 )

  delfunc! TestPopupContents
  %bwipe!
endfunction
