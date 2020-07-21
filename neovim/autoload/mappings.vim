" Cycle the number of columns
" 100 -> 120 -> 80 -> 100
function! mappings#cycle_columns() abort
  execute {
        \ '': 'set textwidth=100',
        \ '100': 'set textwidth=120',
        \ '120': 'set textwidth=80',
        \ '80': 'set textwidth=100'
        \ }[&textwidth]

  echo &textwidth

  if exists('+colorcolumn')
    let &colorcolumn = &textwidth + 1
  endif
endfunction

" Cycle through inccommand modes
" NeoVim only, please guard this function appropriately
function! mappings#cycle_inccommand() abort
  execute {
    \ 'nosplit':  'set inccommand=split',
    \ 'split':    'set inccommand=nosplit',
  \}[&inccommand]
endfunction


" Copy buffer to clipboard
function! mappings#copy_buffer_to_clipboard() abort
  call setreg('+', join(getline(1, '$'), "\n"))
endfunction

" Copy visual selection to clipboard
function! mappings#copy_selection_to_clipboard() abort
  call setreg('+', functions#get_visual_selection())
endfunction

" Copy relative path to the current file to clipboard
function! mappings#copy_current_file_relative_path_to_clipboard() abort
  call setreg('+', @%)
endfunction

" Copy absolute path to the current file to clipboard
function! mappings#copy_current_file_absolute_path_to_clipboard() abort
  call setreg('+', expand('%:p'))
endfunction

" Show documentation for symbol under cursor with CoC
function! mappings#show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
