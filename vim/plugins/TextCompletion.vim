" ***************************** Code Completion *********************************** "
" Auto  complete with tab
function! GetSuggestions()
    let current_column = col('.') - 1                        " Column of the cursor
    let current_character = getline('.')[current_column - 1] " Character under cursor
    if !current_column || current_character !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <silent> <Tab> <c-r>=GetSuggestions()<CR>
inoremap <silent> <S-Tab> <c-n>

" ***************************** Get Quick Bullets ********************************** "

" Press comma twice, in insert mode, to enter a bullet
function! GetBullets()
    let col = col('.')
    if getline('.') =~ (',\%' . col . 'c')
        return "\<BS>=> "
    else
        return ","
    endif
endfunction

inoremap <expr><silent>  ,  GetBullets()

" ********************** Autocompletion in Search Mode ***************************** "

" Tab completion during search command window
function! s:search_mode_start()
    cnoremap <tab> <c-f>:resize 1<CR>a<c-n>
    let s:old_complete_opt = &completeopt
    let s:old_last_status = &laststatus
    set completeopt-=noinsert
    set laststatus=0
endfunction

function! s:search_mode_stop()
    try
        silent cunmap <tab>
    catch
    finally
        let &completeopt = s:old_complete_opt
        let &laststatus  = s:old_last_status
    endtry
endfunction

augroup SearchCompletions
    autocmd!
    autocmd CmdlineEnter [/\?] call <SID>search_mode_start()
    autocmd CmdlineLeave [/\?] call <SID>search_mode_stop()
augroup END

" *********************************************************************** "
