" *************************************       A Comment Toggle Utility      ***************************************
" Key Bindings : ,+/                                                                                              *
" Supported Languages : Python, VimScript                                                                         *
" Functionalities : Single line comment/uncomment by default.                                                     *
"                   Prepend a number before the command to comment/uncomment set of lines                         *
"                   in downwards direction.                                                                       *
" *****************************************************************************************************************

let b:supported_files = {'python':'#', 'sh':'#', 'tmux':'#', 'rb':'#', 'java':'//', 'js':'//', 'vim':'"'}

for k in keys(b:supported_files)
   "  if &filetype == k
        let b:comment_char = b:supported_files[k]
        break
    endif
endfor

function! Main()

    " Get number of lines
    let number_of_lines = v:count1

    " Mark the spot
    execute 'normal! mm'

    " Comment SingleLine
    if number_of_lines == 1
        call SingleLineToggle()
        return
    endif

    " Toggle each line individually
    while number_of_lines >= 0

        " Check if line is already commented
        let var = Decider()

        " var = 1 means line needs to commented
        if var == 1
            " Comment the line
            call Comment()
        " var = 0 or -1 means line needs to be uncommented
        elseif var == 0 || var == -1
            " Uncomment the line
            call Uncomment(var)
        " var = -2 means an Usupported FileType
        elseif var == -2
            " Display an error message and abort execution
            echo 'Unsupported FileType'
            return
        endif

       " Go down one line
        execute 'normal! j'

        " Decrement the number_of_lines left
        let number_of_lines -= 1
    endwhile

    " Go back to initial spot, still needs work
    execute 'normal! `m'

endfunction

" Decides weather to comment or uncomment a line
function! Decider()

    let comment_char = b:comment_char
    " Get char at 0th position
    execute 'normal! mc'
    execute 'normal! 0'
    let char_at_0 = getline('.')[col('.') - 1]
    execute 'normal `c'

    " If char_at_0 is a whitespace char
    if char_at_0 == ' '
        " Get 1st non whitespace char
        execute 'normal! I'
        execute 'normal! l'
        let first_char = getline('.')[col('.') - 1]
        " If first_char is NOT a comment_char
        if first_char != comment_char
            return 1
        endif
        " If first_char is a comment_char
        if first_char == comment_char
            return -1
        endif
    " If char_at_0 is NOT a whitespace char
    else
        " If char_at_0 is NOT a comment_char
        if char_at_0 != comment_char
            return 1
        endif
        " If char_at_0 is a comment_char
        if char_at_0 == comment_char
            return 0
        endif
    endif
endfunction

function! SingleLineToggle()

    let comment_char = b:comment_char
    let first_char = getline('.')[col('.') - 1]
    let current_line = getline('.')

    if current_line =~ '^\s*.'comment_char.'\s*'
        echo 'Hi'
    else
        echo 'Bye'
    endif

endfunction


function! Comment()

    let comment_char = b:comment_char
    " Comment the line and get bck to same spot, still pending
    execute 'normal! mc'
    execute 'normal! I'
    execute 'normal! i'.comment_char.' '
    execute 'normal! `c'

endfunction


function! Uncomment(var)

    " Get var from Decider
    let var = a:var

    " Delete char at 0th position and a space after it
    if var == 0
        execute 'normal! mc'
        execute 'normal! 0xx'
        execute 'normal `chh'
        return
    endif

    " Delete 1st non whitespace char
    if var == -1
        execute 'normal! mc'
        execute 'normal! I'
        execute 'normal! l'
        execute 'normal! x'
        execute 'normal! `ch'
        return
    endif

endfunction

nmap <silent> <leader>/ :<C-u>call Main()<CR>
