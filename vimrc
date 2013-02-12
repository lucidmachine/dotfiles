" """""""
" General
" """""""
" Document Formatting
set autoindent
set expandtab
set nowrap
set shiftwidth=4
set smarttab
set tabstop=4

" Filetype Support
filetype on
filetype plugin on
filetype indent on
syntax on

" Filetype-specific Settings
autocmd BufWritePost *.js !jsmin < % > `echo % | sed 's/\./.min./'`
autocmd BufWritePost *.json !python -m json.tool && jsmin < % > `echo % | sed 's/\./.min./'`
autocmd FileType make setlocal noexpandtab
autocmd FileType otl setlocal spell

" Mouse support
set mouse=a

" Search
set incsearch
set hlsearch

" """"""""""
" Appearance
" """"""""""
set laststatus=2 " Statusline always on
set statusline=%F%m%r%w\ \ [%l, %v][%p%%]


" """"""""""""
" Key Bindings
" """"""""""""
" Function Key Bindings
set pastetoggle=<F2>

" Tabs
noremap <silent> <C-PageDown> :tabnext<CR>
noremap <silent> <C-PageUp> :tabprevious<CR>
noremap <silent> <C-t> :tabnew<CR>

" View Panes
noremap <silent> <F8> :TlistToggle<CR>


" """""""
" Plugins
" """""""
" Taglist
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Sort_Type = "name"
let Tlist_Use_SingleClick = 1
