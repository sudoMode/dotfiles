" Trim trailing white spaces
" function! TrimTrailingWhiteSpaces()
"     execute "normal! m1"
"     %s/\s\+$//ge
"     execute "normal! `1"
" endfunction

" call TrimTrailingWhiteSpaces()
" nmap <silent> <leader>ws :call TrimTrailingWhiteSpaces()<CR>
