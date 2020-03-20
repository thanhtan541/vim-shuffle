function SetUp()
    let init_script = g:test_path . '/../support/test_simple.vim'
    execute 'source ' . init_script
endfunction

function Test_Shuffle_Nothing_Case()
    call feedkeys( "i", 'xt' )
    call shuffle#OrderParams()
    call assert_equal( '', getline( 1 ) )
    %bwipe!
endfunction

function Test_Shuffle_Not_Qualify_Case()
    call feedkeys( "ilet a = something", 'xt' )
    call shuffle#OrderParams()
    call assert_equal( 'let a = something', getline( 1 ) )
    %bwipe!
endfunction

function Test_Shuffle_Simple_Case()
    call feedkeys( "i(one, two, three)", 'xt' )
    call shuffle#OrderParams()
    call assert_equal( '(three, two, one)', getline( 1 ) )
    %bwipe!
endfunction

function Test_Shuffle_Not_Format_Case()
    call feedkeys( "i(one,two,three)", 'xt' )
    call shuffle#OrderParams()
    call assert_equal( '(three, two, one)', getline( 1 ) )
    %bwipe!
endfunction

function Test_Shuffle_Chaos_Case()
    call feedkeys( "i(one , two ,three)", 'xt' )
    call shuffle#OrderParams()
    call assert_equal( '(three, two, one)', getline( 1 ) )
    %bwipe!
endfunction

function Test_Shuffle_Raw_Input_Values()
    call feedkeys( "i(\"one\" , \"two\" , 12)", 'xt' )
    call shuffle#OrderParams()
    call assert_equal( '(12, "two", "one")', getline( 1 ) )
    %bwipe!
endfunction

function Test_Shuffle_Php_Style()
    call feedkeys( "i($a, $b, $c)", 'xt' )
    call shuffle#OrderParams()
    call assert_equal( '($c, $b, $a)', getline( 1 ) )
    %bwipe!
endfunction

function Test_Shuffle_Keyword_Args()
    call feedkeys( "i(bar=1, foo=2)", 'xt' )
    call shuffle#OrderParams()
    call assert_equal( '(foo=2, bar=1)', getline( 1 ) )
    %bwipe!
endfunction
