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
Plug 'crusoexia/vim-monokai'                    " Monokai theme
Plug 'itchyny/lightline.vim'                    " Lightweight status line
Plug 'mhinz/vim-signify'                        " VCS diff gutter
Plug 'Yggdroot/indentLine'                      " Indentation level lines

" Other
Plug 'editorconfig/editorconfig-vim'            " Cross-editor config files
Plug 'garbas/vim-snipmate'                      " Snippets
Plug 'kien/ctrlp.vim'                           " Fuzzy finder pallette
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'markonm/traces.vim'                       " Substitute preview
Plug 'milkypostman/vim-togglelist'              " Toggle fix lists
Plug 'tomtom/tcomment_vim'                      " Filetype-sensible comment
Plug 'tomtom/tlib_vim'
Plug 'terryma/vim-multiple-cursors'             " Multi-cursor
Plug 'tpope/vim-fugitive'                       " Git commands from inside ViM
Plug 'tpope/vim-projectionist'                  " Project navigation
Plug 'tpope/vim-surround'                       " Match parens, tags, etc.
Plug 'vim-scripts/taglist.vim'                  " Code tag viewer
Plug 'wincent/loupe'                            " Search enhancements
Plug 'wincent/scalpel'                          " Quick replace word
Plug 'wincent/terminus'                         " Terminal integration

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
if v:version > 703
    set formatoptions +=j                      " Join sans comment leader
endif

" Filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

au BufRead,BufNewFile *.sbt set filetype=scala

au FileType make setlocal noexpandtab
au FileType markdown setlocal conceallevel=0
au FileType votl setlocal spell
augroup pencil
    au!
    au FileType markdown,mkd    call pencil#init({'wrap': 'soft'})
    au FileType markdown,mkd    setlocal spell
    au FileType text            call pencil#init({'wrap': 'hard'})
    au FileType text            setlocal spell
augroup END
augroup XML
    au!
    au FileType xml let g:xml_syntax_folding=1
    au FileType xml setlocal foldmethod=syntax
    au FileType xml :syntax on
    au FileType xml :%foldopen!
augroup END
au FileType json setlocal conceallevel=0        " Don't hide quotes

" File tree browser
let g:netrw_banner = 0                          " Disable banner
let g:netrw_liststyle = 3                       " Filetree browser style
let g:netrw_altv = 1                            " Split vertically
let g:netrw_bufsettings = 'number'              " Use line numbers

" Search
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

" UI
set lazyredraw                                  " Macros don't redraw

" Working files
set updatetime=1000                             " Write to swap every n ms

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

" Focus
if exists('+winhighlight')
    augroup focus
        au!
        au ColorScheme * hi link MyInactiveWin ColorColumn | hi link MyNormalWin Normal
        au FileType,BufWinEnter * call autocmds#configure_winhighlight()
        au FocusGained * hi link MyNormalWin Normal
        au FocusLost * hi link MyNormalWin MyInactiveWin
    augroup END
endif


" Cursor
set cursorline

" Theme
try
    colorscheme monokai
catch /^Vim\%((\a\+)\)\=:E185
    colorscheme murphy
endtry
set background=dark

" Ruler / Status line
set laststatus=2
let g:lightline = {'colorscheme': 'wombat'}

" Gutter
set number relativenumber


""""""""""
" Commands
""""""""""
" Find all TODOs and FIXMEs in the current project and list them in the 
" TODO: command! todo :vimgrep /TODO/j **/*.$current_file's_extension | :cw


""""""""""
" Mappings
""""""""""
let mapleader = " "
let maplocalleader = ","

" Comments
noremap <C-_> :TComment<CR>

" Copy Ranges
noremap <silent> <Leader>c :call mappings#copy_buffer_to_clipboard()<CR>
xnoremap <silent> <Leader>c :call mappings#copy_selection_to_clipboard()<CR>

" Refactorings
nmap <Leader>rr <Plug>(Scalpel)

" Files
noremap <silent> <F8> :Vexplore<CR>
noremap <silent> <Leader>ff :Explore<CR>

" Tags
noremap <silent> <F7> :TlistToggle<CR>
noremap <silent> <Leader>gt :TlistToggle<CR>

" Toggles
noremap <silent> <Leader>tc :call mappings#cycle_colorcolumn()<CR>
noremap <silent> <Leader>tl :call mappings#cycle_numbering()<CR>

" Lists
noremap <silent> <Leader>ll :call ToggleLocationList()<CR>
noremap <silent> <Leader>ln :lnext<CR>
noremap <silent> <Leader>lp :lprevious<CR>
noremap <silent> <Leader>qq :call ToggleQuickfixList()<CR>
noremap <silent> <Leader>qn :cnext<CR>
noremap <silent> <Leader>qp :cprevious<CR>

" Windows
noremap <Leader>wo :only<CR>
noremap <Leader>ww <C-W>=
noremap <Leader>wh <C-W>h
noremap <Leader>wj <C-W>j
noremap <Leader>wk <C-W>k
noremap <Leader>wl <C-W>l
noremap <Leader>wH <C-W>H
noremap <Leader>wJ <C-W>J
noremap <Leader>wK <C-W>K
noremap <Leader>wL <C-W>L


"""""""""""""""
" Plugin Config
"""""""""""""""
" CoC
let g:coc_enable_locationlist = 0
let g:coc_global_extensions = ['coc-conjure']

" Projectionist
function! s:project(...)
  for [l:pattern, l:projection] in a:000
    let g:projectionist_heuristics['*'][l:pattern] = l:projection
  endfor
endfunction

let g:projectionist_heuristics = {
    \   '*': {
    \     '*.c': {
    \       'alternate': '{}.h',
    \       'type': 'source'
    \     },
    \     '*.h': {
    \       'alternate': '{}.c',
    \       'type': 'header'
    \     }
    \   }
    \ }

for s:extension in ['.js', '.jsx', '.ts', '.tsx']
    call s:project(
        \ ['*' . s:extension, {
        \   'alternate': [
        \     '{dirname}/{basename}.test' . s:extension,
        \     '{dirname}/__tests__/{basename}-test' . s:extension,
        \     '{dirname}/__tests__/{basename}-mocha' . s:extension
        \   ],
        \   'type': 'source'
        \ }],
        \ ['*.test' . s:extension, {
        \   'alternate': '{basename}' . s:extension,
        \   'type': 'test',
        \ }],
        \ ['**/__tests__/*-test' . s:extension, {
        \   'alternate': '{dirname}/{basename}' . s:extension,
        \   'type': 'test'
        \ }],
        \ ['**/__tests__/*-mocha' . s:extension, {
        \   'alternate': '{dirname}/{basename}' . s:extension,
        \   'type': 'test'
        \ }])
endfor

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
