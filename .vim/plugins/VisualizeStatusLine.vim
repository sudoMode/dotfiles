" Visualize Status Line

" Default status line
hi statusline ctermfg=65 ctermbg=15
hi StatusLineNC ctermfg=235 ctermbg=14
" Custom Configs
function! VisualizeStatusLine(mode)
    if a:mode == 'i'
        hi statusline ctermfg=160 ctermbg=232
    elseif a:mode == 'r'
        hi statusline ctermfg=2 ctermbg=7
    endif
endfunction

au InsertEnter * call VisualizeStatusLine(v:insertmode)
au InsertChange * call VisualizeStatusLine(v:insertmode)
au InsertLeave * hi statusline ctermfg=52  ctermbg=15
