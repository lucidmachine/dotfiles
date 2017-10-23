" """"""
" Vundle
" """"""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'ervandew/supertab'              " Tab completion
Plugin 'flazz/vim-colorschemes'         " Color sheme pack
Plugin 'garbas/vim-snipmate'            " Snippets
Plugin 'kien/ctrlp.vim'                 " Fuzzy finder for files, buffers, tags, etc.
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mhinz/vim-signify'              " VCS diff gutter
Plugin 'rust-lang/rust.vim'             " Rust support including Syntastic integration
Plugin 'scrooloose/nerdtree'            " File tree explorer
Plugin 'scrooloose/syntastic'           " Syntax checking system
Plugin 'sealemar/vtl'                   " Velocity syntax + filetype
Plugin 'tomtom/tcomment_vim'            " Fileteype-sensible comment
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'             " Git commands from inside ViM
Plugin 'vimoutliner/vimoutliner'        " Outline mode for .otl files
Plugin 'vim-scripts/taglist.vim'        " Code tag viewer
Plugin 'VundleVim/Vundle.vim'           " Plugin manager
Plugin 'Yggdroot/indentLine'            " Display vertical indentation level lines

call vundle#end()


" """""""
" General
" """""""
" Backspace
set backspace=indent,eol,start

" Compatibility
set nocompatible


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
"autocmd BufWritePost *.js !jsmin < % > `echo % | sed 's/\./.min./'`
"autocmd BufWritePost *.json !python -m json.tool && jsmin < % > `echo % | sed 's/\./.min./'`
autocmd FileType make setlocal noexpandtab
autocmd FileType otl setlocal spell
augroup filetype
    autocmd BufNewFile,BufRead *.html set filetype=php
augroup END


" Mouse support
set mouse=a

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" UI
set updatetime=1000

" Visual Bell
set visualbell

" """"""""""
" Appearance
" """"""""""
" Cmder color palette fix
if !empty($CONEMUBUILD)
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif

" Theme
colorscheme vibrantink
colorscheme harlequin

" Ruler / Status line
set ruler " Displays the line, column, and document % in lower-right corner.

" Gutter
set number


" """"""""
" Commands
" """"""""
" Find all TODOs and FIXMEs in the current project and list them in the 
" TODO: command! todo :vimgrep /TODO/j **/*.$current_file's_extension | :cw


" """"""""""""
" Key Bindings
" """"""""""""
" Function Key Bindings
set pastetoggle=<F2>

" File Commands
noremap <silent> <C-o> :browse confirm e<CR>

" Tabs
noremap <silent> <C-PageDown> :tabnext<CR>
noremap <silent> <C-PageUp> :tabprevious<CR>
noremap <silent> <C-t> :tabnew<CR>
noremap <silent> <C-w> :tabclose<CR>

" View Panes
noremap <silent> <F7> :NERDTreeToggle<CR>
noremap <silent> <F8> :TlistToggle<CR>

" Buffers
noremap <silent> <C-c> ggVG"+y


" """""""
" Plugins
" """""""
" Rust Racer
set hidden
let $RUST_SRC_PATH="~/src/rust/src/"

" Signify
let g:signify_vcs_list = [ 'git', 'hg', 'bzr' ]
let g:signify_update_on_focusgained = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Taglist
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Sort_Type = "name"
let Tlist_Use_SingleClick = 1
