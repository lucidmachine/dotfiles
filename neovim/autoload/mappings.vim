" Cycle the number of columns
" 100 -> 120 -> 80 -> 100
" If the current textwidth isn't part of the cycle, then it will restart at 100
function! mappings#cycle_columns() abort
  let next_width = { 100: '120', 120: '80', 80: '100', }
  let &textwidth = get(next_width, &textwidth, '100')

  echo &textwidth

  if exists('+colorcolumn')
    let &colorcolumn = &textwidth + 1
  endif
endfunction

" Cycle through inccommand modes
" NeoVim only, please guard this function appropriately
function! mappings#cycle_inccommand() abort
  let next_mode = { 'split': 'nosplit', 'nosplit': 'split' }
  let &inccommand = get(next_mode, &inccommand, 'split')

  echo &inccommand
endfunction

" Set the indentation mode
" Modes:
"   's2' - Tab = 2 Spaces
"   's4' - Tab = 4 Spaces
"   't2' - Tab = 1 Tab, 2 Spaces wide
"   't4' - Tab = 1 Tab, 4 Spaces wide
"   Else - Tab = 2 Spaces
function! mappings#set_indentation(indentation_mode) abort
  if (a:indentation_mode == 's2')
    set expandtab
    set shiftwidth=2
    set tabstop=2
    echom 'Tab = 2 Spaces'
  elseif (a:indentation_mode == 's4')
    set expandtab
    set shiftwidth=4
    set tabstop=4
    echom 'Tab = 4 Spaces'
  elseif (a:indentation_mode == 't2')
    set noexpandtab
    set shiftwidth=2
    set tabstop=2
    echom 'Tab = 1 Tab, 2 Spaces wide'
  elseif (a:indentation_mode == 't4')
    set noexpandtab
    set shiftwidth=4
    set tabstop=4
    echom 'Tab = 1 Tab, 4 Spaces wide'
  else
    set expandtab
    set shiftwidth=2
    set tabstop=2
    echom 'Tab = 2 Spaces'
  endif
endfunction

let s:indentation_mode='s2'

" Cycle through indentation modes
function! mappings#cycle_indentation() abort
  let next_indentation_mode = {'s2': 's4', 's4': 't2', 't2': 't4', 't4': 's2'}
  let s:indentation_mode = get(next_indentation_mode, s:indentation_mode, 's2')
  call mappings#set_indentation(s:indentation_mode)
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
