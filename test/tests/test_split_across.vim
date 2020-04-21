function SetUp()
    let init_script = g:test_path . '/../lib/test_simple.vim'
    execute 'source ' . init_script
endfunction

" Before:
" (arg1, arg2, arg3)
" After:
" (
"     arg1,
"     arg2,
"     arg3,
" )
function Test_Shuffle_Split_Across_Function_Case()
    call feedkeys( "i(one, two, three)", 'xt' )
    let four_spaces = '    '
    call shuffle#OrderParams(0, 0)
    call assert_equal( '(', getline( 1 ) )
    call assert_equal( &shiftwidth, indent( 2 ) )
    call assert_equal( &shiftwidth, indent( 3 ) )
    call assert_equal( &shiftwidth, indent( 4 ) )
    call assert_equal( ')', getline( 5 ) )
    %bwipe!
endfunction

function Test_Shuffle_Split_Across_Method_Case()
    let indent_spaces = repeat( ' ', &shiftwidth )
    call feedkeys( "i" . indent_spaces . "(one, two, three)", 'xt' )
    let four_spaces = '    '
    call shuffle#OrderParams(0, 0)
    call assert_equal( indent_spaces . '(', getline( 1 ) )
    call assert_equal( &shiftwidth * 2, indent( 2 ) )
    call assert_equal( &shiftwidth * 2, indent( 3 ) )
    call assert_equal( &shiftwidth * 2, indent( 4 ) )
    call assert_equal( indent_spaces . ')', getline( 5 ) )
    %bwipe!
endfunction
