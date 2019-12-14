let g:WinHighlightFileTypeBlacklist = ['diff', 'undotree', 'nerdtree']
let g:WinHighlightBufferTypeWhitelist = ['nofile', 'nowrite', 'acwrite', 'quickfix', 'help']

function! autocmds#should_winhighlight() abort
    return index(g:WinHighlightFileTypeBlacklist, &filetype) == -1
            \ && index(g:WinHighlightBufferTypeWhitelist, &buftype) != -1
endfunction

function! autocmds#configure_winhighlight()
    if autocmds#should_winhighlight()
        set winhighlight=Normal:MyNormalWin,NormalNC:MyNormalWin
    else
        set winhighlight=Normal:MyNormalWin,NormalNC:MyInactiveWin
    endif
endfunction
