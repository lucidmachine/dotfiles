set nocompatible

"""""""""
" Plugins
"""""""""
filetype off
call plug#begin('~/.config/nvim/plugged')

" Language Support
Plug 'derekwyatt/vim-scala'                     " Scala support
Plug 'masukomi/vim-markdown-folding'            " Fold markdown headers
Plug 'neoclide/coc.nvim', {
\   'branch': 'release'
\}                                              " LSP-based completion engine
Plug 'Olical/conjure', {
\   'tag': 'v2.1.0',
\   'do': 'bin/compile'
\}                                              " Clojure support
Plug 'reedes/vim-pencil'                        " Prose format and nav
Plug 'rust-lang/rust.vim'                       " Rust support 
Plug 'scrooloose/syntastic'                     " Syntax checking system
Plug 'vimoutliner/vimoutliner'                  " Outline mode for .otl files

" Appearance
Plug 'dylanaraps/wal'                           " Set colorscheme with wal util
Plug 'itchyny/lightline.vim'                    " Lightweight status line
Plug 'mhinz/vim-signify'                        " VCS diff gutter
Plug 'Yggdroot/indentLine'                      " Indentation level lines

" Other
Plug 'ervandew/supertab'                        " Tab completion
Plug 'editorconfig/editorconfig-vim'            " Cross-editor config files
Plug 'garbas/vim-snipmate'                      " Snippets
Plug 'kien/ctrlp.vim'                           " Fuzzy finder pallette
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'scrooloose/nerdtree'                      " File tree explorer
Plug 'tomtom/tcomment_vim'                      " Filetype-sensible comment
Plug 'tomtom/tlib_vim'
Plug 'terryma/vim-multiple-cursors'             " Multi-cursor
Plug 'tpope/vim-fugitive'                       " Git commands from inside ViM
Plug 'tpope/vim-surround'                       " Match parens, tags, etc.
Plug 'vim-scripts/taglist.vim'                  " Code tag viewer

call plug#end()


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

" Filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

au BufRead,BufNewFile *.sbt set filetype=scala

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
try
    colorscheme wal
catch /^Vim\%((\a\+)\)\=:E185
    colorscheme murphy
endtry
set background=dark

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
noremap <C-_> :TComment<CR>

" Function Key Bindings
set pastetoggle=<F2>

" File Commands
noremap <silent> <C-o> :browse confirm e<CR>

" View Panes
noremap <silent> <F8> :NERDTreeToggle<CR>
noremap <silent> <F7> :TlistToggle<CR>

" Buffers
noremap <silent> <C-c> ggVG"+y


"""""""""""""""
" Plugin Config
"""""""""""""""
" CoC
let g:coc_global_extensions = ['coc-conjure']

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
