set nocompatible

"""""""""
" Plugins
"""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Language Support
"Plugin 'dense-analysis/ale'             " Async LSP server support
Plugin 'masukomi/vim-markdown-folding'  " Fold markdown headers
Plugin 'reedes/vim-pencil'              " Format and nav improvements for prose
Plugin 'rust-lang/rust.vim'             " Rust support including Syntastic integration
Plugin 'scrooloose/syntastic'           " Syntax checking system
"Plugin 'valloric/youcompleteme'         " LSP-based tab completion
Plugin 'vimoutliner/vimoutliner'        " Outline mode for .otl files

" Appearance
Plugin 'dylanaraps/wal'                 " Integrate colorscheme with wal util
Plugin 'itchyny/lightline.vim'          " Lightweight status line
Plugin 'mhinz/vim-signify'              " VCS diff gutter
Plugin 'Yggdroot/indentLine'            " Display vertical indentation level lines

" Other
Plugin 'ervandew/supertab'              " Tab completion
Plugin 'editorconfig/editorconfig-vim'  " Cross-editor configuration files
Plugin 'garbas/vim-snipmate'            " Snippets
Plugin 'kien/ctrlp.vim'                 " Fuzzy finder for files, buffers, tags, etc.
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'scrooloose/nerdtree'            " File tree explorer
Plugin 'tomtom/tcomment_vim'            " Filetype-sensible comment
Plugin 'tomtom/tlib_vim'
Plugin 'terryma/vim-multiple-cursors'   " Multi-cursor
Plugin 'tpope/vim-fugitive'             " Git commands from inside ViM
Plugin 'tpope/vim-surround'             " Matching parens, braces, tags, etc.
Plugin 'vim-scripts/taglist.vim'        " Code tag viewer
Plugin 'VundleVim/Vundle.vim'           " Plugin manager

call vundle#end()


"""""""""
" General
"""""""""
" Backspace
set backspace=indent,eol,start

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
autocmd FileType make setlocal noexpandtab
autocmd FileType votl setlocal nowrap
autocmd FileType votl setlocal spell
augroup filetype
    autocmd BufNewFile,BufRead *.html set filetype=php
augroup END
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd   call pencil#init({'wrap': 'soft'})
    autocmd FileType text           call pencil#init({'wrap': 'soft'})
augroup END

" Mouse support
set mouse=a

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

" UI
set updatetime=1000

" Visual Bell
set visualbell

""""""""""""
" Appearance
""""""""""""
" Cmder color palette fix
if !empty($CONEMUBUILD)
    set term=xterm
    set t_Co=256
    let &t_AB = "\e[48;5;%dm"
    let &t_AF = "\e[38;5;%dm"
endif

" Theme
set background=dark
colorscheme wal

" Ruler / Status line
set laststatus=2
let g:lightline = {'colorscheme': 'seoul256'}

" Gutter
set number


""""""""""
" Commands
""""""""""
" Find all TODOs and FIXMEs in the current project and list them in the 
" TODO: command! todo :vimgrep /TODO/j **/*.$current_file's_extension | :cw


""""""""""""""
" Key Bindings
""""""""""""""
" Comments
if has('win32')
  noremap <C-/> :TComment<CR>
else
  noremap <C-_> :TComment<CR>
endif

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
noremap <silent> <F8> :NERDTreeToggle<CR>
noremap <silent> <F7> :TlistToggle<CR>

" Buffers
noremap <silent> <C-c> ggVG"+y


"""""""""""""""
" Plugin Config
"""""""""""""""
" Ale
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\    'javascript': ['standard']
\}
let g:ale_fixers = {
\    'javascript': ['standard']
\}

" Rust Racer
set hidden
let $RUST_SRC_PATH = "~/src/rust/src/"

" Signify
let g:signify_vcs_list = ['git', 'hg', 'bzr']
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
