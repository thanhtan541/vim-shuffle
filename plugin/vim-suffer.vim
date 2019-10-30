function! StringListShuffle()
    let selected_string = GetVisualSelection()
    let string_list = split(selected_string, ',')
    let string_reversed = reverse(string_list )
    let @a = join(string_reversed , ",")
    normal "ap
endfunction

function! GetVisualSelection()
    if mode() == "v"
        let [line_start, column_start] = getpos("v")[1:2]
        let [line_end, column_end] = getpos(".")[1:2]
    else
        let [line_start, column_start] = getpos("'<")[1:2]
        let [line_end, column_end] = getpos("'>")[1:2]
    end
    if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
        let [line_start, column_start, line_end, column_end] =
                    \   [line_end, column_end, line_start, column_start]
    end
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - 1]
    let lines[0] = lines[0][column_start - 1:]
    return lines[0]
endfunction

function! PasteStringIntoSelection()
    echo 'Something'
endfunction
