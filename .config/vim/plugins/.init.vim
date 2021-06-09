" Source all config files pressent in ~/.vim/plugins

function! s:SourcePlugins()
    let all_plugins = '~/.vim/plugins/*'
    for plugin in split(glob(all_plugins), '\n')
        if filereadable(plugin)
            execute 'source' plugin
        endif
    endfor
endfunction

call s:SourcePlugins()
