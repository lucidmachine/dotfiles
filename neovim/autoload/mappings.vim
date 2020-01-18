" Cycle through colorcolumn at line 81, 101, and off.
function! mappings#cycle_colorcolumn() abort
    execute {
          \ '': 'set colorcolumn=81',
          \ '0': 'set colorcolumn=81',
          \ '81': 'set colorcolumn=101',
          \ '101': 'set colorcolumn=0',
          \ }[&colorcolumn]
endfunction

" Copy buffer to clipboard
function! mappings#copy_buffer_to_clipboard() abort
    call setreg('+', join(getline(1, '$'), "\n"))
endfunction

" Copy visual selection to clipboard
function! mappings#copy_selection_to_clipboard() abort
    call setreg('+', functions#get_visual_selection())
endfunction
