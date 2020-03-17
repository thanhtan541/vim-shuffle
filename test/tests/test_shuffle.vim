function SetUp()
  let init_script = g:test_path . '/../support/test_simple.vim'
  execute 'source ' . init_script
  call feedkeys( "\<localleader>bl", 'xt' )
endfunction

function Test_Shuffle_Empty()
  call assert_equal( 'ABCDE', getline( 1 ) )
  %bwipe!
endfunction
