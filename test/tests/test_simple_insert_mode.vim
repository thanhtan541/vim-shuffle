function SetUp()
  let init_script = g:test_path . '/../support/test_simple.vim'
  execute 'source ' . init_script
endfunction

function Test_Popup_Menu_Expression_Register()
  function TestPopupContents()
    let items = complete_info().items
    call map( items, {index, value -> value.word} )
    call assert_equal( [ 'Mar', 'May' ], items )
    return ''
  endfunction

  call feedkeys( "iM\<C-x>\<C-u>\<C-r>=TestPopupContents()\<CR>", "xt" )
  call assert_equal( "Mar", getline( 1 ) )

  delfunc! TestPopupContents
  %bwipe!
endfunction

function Test_Simple_Empty()
  function TestPopupContents()
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
    return ''
  endfunction

  call feedkeys( "i\<C-x>\<C-u>\<C-r>=TestPopupContents()\<CR>", "xt" )
  call assert_equal( "Jan", getline( 1 ) )

  delfunc! TestPopupContents
  %bwipe!
endfunction
