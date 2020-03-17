function SetUp()
  let init_script = g:test_path . '/../support/test_simple.vim'
  execute 'source ' . init_script
endfunction

function Test_Simple_Empty()
  call feedkeys( "i\<C-x>\<C-u>", 'xt' )
  call assert_equal( 'Jan', getline( 1 ) )
  %bwipe!
endfunction

function Test_Simple_February()
  call feedkeys( "iF\<C-x>\<C-u>", 'xt' )
  call assert_equal( 'Feb', getline( 1 ) )
  %bwipe!
endfunction

function Test_Simple_March()
  call feedkeys( "iM\<C-x>\<C-u>", 'xt' )
  call assert_equal( 'Mar', getline( 1 ) )
  %bwipe!
endfunction

function Test_Simple_May()
  call feedkeys( "iM\<C-x>\<C-u>\<C-n>", 'xt' )
  call assert_equal( 'May', getline( 1 ) )
  %bwipe!
endfunction

