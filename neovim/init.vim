"""""""""
" Plugins
"""""""""
filetype off
call plug#begin('~/.config/nvim/plugged')

" Language Support
Plug 'elubow/cql-vim'                           " Cassandra Query Language support
Plug 'l04m33/vlime', {
\   'rtp': 'vim/'
\}                                              " Common Lisp support
Plug 'masukomi/vim-markdown-folding'            " Fold markdown headers
Plug 'neoclide/coc.nvim', {
\   'tag': 'v0.0.78'
\}                                              " LSP-based completion engine
Plug 'Olical/conjure', {
\   'tag': 'v4.1.0'
\}                                              " Clojure support
Plug 'vimoutliner/vimoutliner'                  " Outline mode for .otl files

" Appearance
Plug 'crusoexia/vim-monokai'                    " Monokai theme
Plug 'itchyny/lightline.vim'                    " Lightweight status line
Plug 'mhinz/vim-signify'                        " VCS diff gutter
Plug 'Yggdroot/indentLine'                      " Indentation level lines

" Other
Plug 'ctrlpvim/ctrlp.vim'                       " Fuzzy finder pallette
Plug 'editorconfig/editorconfig-vim'            " Cross-editor config files
Plug 'garbas/vim-snipmate'                      " Snippets
Plug 'jiangmiao/auto-pairs'                     " Balance paired characters
Plug 'kien/rainbow_parentheses.vim'             " Rainbow parentheses
Plug 'liuchengxu/vim-which-key', {
\   'on': ['WhichKey', 'WhichKey!']
\}                                              " Show mappings on timeout
Plug 'MarcWeber/vim-addon-mw-utils'             " Dependency for Snipmate
Plug 'markonm/traces.vim'                       " Substitute preview
Plug 'milkypostman/vim-togglelist'              " Toggle fix lists
Plug 'thinca/vim-visualstar'                    " Search a visual mode selection
Plug 'tpope/vim-commentary'                     " Toggle comments
Plug 'tpope/vim-fugitive'                       " Git commands from inside ViM
Plug 'tpope/vim-surround'                       " Manipulate parens, tags, etc.
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
set conceallevel=0                             " Don't conceal characters
set expandtab
set nowrap
set shiftwidth=2
set smarttab
set tabstop=2
if v:version > 703
    set formatoptions +=j                      " Join sans comment leader
endif

" Filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

au FileType make setlocal noexpandtab
au FileType votl setlocal spell
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParenthesesToggleAll
augroup END
augroup prose
    au!
    au FileType markdown,text setlocal spell
augroup END
augroup XML
    au!
    au FileType xml let g:xml_syntax_folding=1
    au FileType xml setlocal foldmethod=syntax
    au FileType xml :syntax on
    au FileType xml :%foldopen!
augroup END

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

" Splits
set splitbelow

" Terminal
if has('nvim')
  au TermOpen * :startinsert
endif

" Textwidth
set textwidth=100

" UI
set lazyredraw                                  " Macros don't redraw

" Visual Bell
set visualbell

" Working files
set updatetime=300                              " Write to swap every n ms


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

" ColorColumn
if exists('+colorcolumn')
  let &colorcolumn = &textwidth + 1
endif

" Cursor
set cursorline

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

" Gutter
set number
if exists('+relativenumber')
  set relativenumber
endif

" Ruler / Status line
set laststatus=2
let g:lightline = {'colorscheme': 'wombat'}

" Theme
try
    colorscheme monokai
catch /^Vim\%((\a\+)\)\=:E185
    colorscheme murphy
endtry
set background=dark


""""""""""
" Mappings
""""""""""
let mapleader = " "
let maplocalleader = ","

" Buffers
noremap <silent> <leader>bb :buffers<CR>
noremap <silent> <leader>ba :ball<CR>
noremap <silent> <leader>b1 :buffer 1<CR>
noremap <silent> <leader>b2 :buffer 2<CR>
noremap <silent> <leader>b3 :buffer 3<CR>
noremap <silent> <leader>b4 :buffer 4<CR>
noremap <silent> <leader>b5 :buffer 5<CR>
noremap <silent> <leader>b6 :buffer 6<CR>
noremap <silent> <leader>b7 :buffer 7<CR>
noremap <silent> <leader>b8 :buffer 8<CR>
noremap <silent> <leader>b9 :buffer 9<CR>
noremap <silent> <leader>b0 :buffer 10<CR>

" Comments
xmap <leader>; <Plug>Commentary
nmap <leader>; <Plug>Commentary
omap <leader>; <Plug>Commentary
nmap <leader>;; <Plug>CommentaryLine

" Copy
noremap <silent> <leader>cc :call mappings#copy_buffer_to_clipboard()<CR>
xnoremap <silent> <leader>cc :call mappings#copy_selection_to_clipboard()<CR>
noremap <silent> <leader>cp :call mappings#copy_current_file_relative_path_to_clipboard()<CR>
noremap <silent> <leader>cP :call mappings#copy_current_file_absolute_path_to_clipboard()<CR>

" Documentation
nnoremap <silent> K :call mappings#show_documentation()<CR>

" Files
noremap <silent> <leader>ff :Explore<CR>

" Goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Lists
noremap <silent> <leader>ll :call ToggleLocationList()<CR>
noremap <silent> <leader>ln :lnext<CR>
noremap <silent> <leader>lp :lprevious<CR>
noremap <silent> <leader>qq :call ToggleQuickfixList()<CR>
noremap <silent> <leader>qn :cnext<CR>
noremap <silent> <leader>qp :cprevious<CR>

" Refactorings
nmap <leader>rr <Plug>(Scalpel)

" Tags
noremap <silent> <leader>gt :TlistToggle<CR>

" Terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Toggles
noremap <silent> <leader>tc :call mappings#cycle_columns()<CR>
if has('nvim')
  noremap <silent> <leader>ts :call mappings#cycle_inccommand()<CR>
endif

" Vim Configuration
noremap <silent> <leader>vv :tabnew $MYVIMRC<CR>
noremap <silent> <leader>vr :source $MYVIMRC<CR>

" WhichKey
nnoremap <silent> <leader> :WhichKey '<leader>'<CR>
nnoremap <silent> <localleader> :WhichKey '<localleader>'<CR>

" Windows
noremap <leader>wo :only<CR>
noremap <leader>ww <C-W>=
noremap <leader>wh <C-W>h
noremap <leader>wj <C-W>j
noremap <leader>wk <C-W>k
noremap <leader>wl <C-W>l
noremap <leader>wH <C-W>H
noremap <leader>wJ <C-W>J
noremap <leader>wK <C-W>K
noremap <leader>wL <C-W>L
noremap <leader>wr <C-W>r
noremap <leader>wR <C-W>R
noremap <leader>w< <C-W><
noremap <leader>w> <C-W>>
noremap <leader>w+ <C-W>+
noremap <leader>w- <C-W>-


"""""""""""""""
" Plugin Config
"""""""""""""""
" CoC
let g:coc_enable_locationlist = 0
let g:coc_global_extensions = ['coc-conjure']

" Conjure
let g:conjure_log_direction = "horizontal"

" Signify
let g:signify_vcs_list = ['git', 'hg', 'bzr']
let g:signify_update_on_focusgained = 1

" Taglist
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Sort_Type = "name"
let Tlist_Use_SingleClick = 1

" Toggle List
let g:toggle_list_no_mappings = 1
