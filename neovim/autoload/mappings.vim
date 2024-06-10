" Copy relative path to the current file to clipboard
function! mappings#copy_current_file_relative_path_to_clipboard() abort
  call setreg('+', @%)
endfunction

" Copy absolute path to the current file to clipboard
function! mappings#copy_current_file_absolute_path_to_clipboard() abort
  call setreg('+', expand('%:p'))
endfunction
