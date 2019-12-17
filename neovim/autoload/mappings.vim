" Cycle through relativenumber + number, number (only), and no numbering.
function! mappings#cycle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!<CR>
  endif
endfunction

function! mappings#cycle_colorcolumn() abort
    execute {
          \ '': 'set colorcolumn=81',
          \ '0': 'set colorcolumn=81',
          \ '81': 'set colorcolumn=101',
          \ '101': 'set colorcolumn=0',
          \ }[&colorcolumn]
endfunction
