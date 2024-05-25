"""""""""
" Plugins
"""""""""
filetype off
call plug#begin('~/.config/nvim/plugged')

" Language Support
Plug 'bakpakin/fennel.vim'                       " Fennel language support
Plug 'elubow/cql-vim', {
      \ 'for': 'cql'
      \}                                         " Cassandra Query Language support
Plug 'gberenfield/cljfold.vim', {
      \ 'for': 'clojure'
      \}                                         " Configurable folding for Clojure
Plug 'l04m33/vlime', {
      \ 'rtp': 'vim/',
      \ 'for': 'lisp'
      \}                                         " Common Lisp environment
Plug 'mfussenegger/nvim-jdtls', {
      \ 'for': 'java'
      \}                                         " Java JDTLS LSP Extensions
Plug 'lucidmachine/vim-velocity', {
      \ 'for': 'vtl'
      \}                                         " Velocity template support
Plug 'mikeboiko/vim-markdown-folding', {
      \ 'for': 'markdown'
      \}                                         " Fold markdown headers
Plug 'Olical/conjure', {
      \ 'for': ['clojure', 'fennel']
      \}                                         " Clojure and Fennel environment
Plug 'pmizio/typescript-tools.nvim', {
      \ 'for': ['typescript', 'javascript']
      \}
Plug 'vimoutliner/vimoutliner', {
      \ 'for': 'votl'
      \}                                         " Outline mode for .otl files
Plug 'vim-scripts/confluencewiki.vim'            " Confluence wiki syntax

" Appearance
Plug 'itchyny/lightline.vim'                     " Lightweight status line
Plug 'mhinz/vim-signify'                         " VCS diff gutter
Plug 'shaunsingh/nord.nvim'                      " Nord theme with Treesitter support
Plug 'Yggdroot/indentLine'                       " Indentation level lines

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'                      " nvim-cmp LSP source
Plug 'hrsh7th/cmp-buffer'                        " nvim-cmp buffer source
Plug 'hrsh7th/cmp-path'                          " nvim-cmp filesystem source
Plug 'hrsh7th/cmp-cmdline'                       " nvim-cmp source for Vim commands
Plug 'hrsh7th/nvim-cmp'                          " nvim-cmp core
Plug 'hrsh7th/cmp-nvim-lua'                      " nvim-cmp source for nvim Lua APIs
Plug 'onsails/lspkind.nvim'                      " nvim-cmp source formatting
Plug 'saadparwaiz1/cmp_luasnip'                  " nvim-cmp LuaSnip source

" Other
Plug 'editorconfig/editorconfig-vim'             " Cross-editor config files
Plug 'jiangmiao/auto-pairs'                      " Balance paired characters
Plug 'junegunn/fzf'                              " Fuzzy finder
Plug 'junegunn/fzf.vim'                          " Vim integration for fzf
Plug 'L3MON4D3/LuaSnip', {
      \ 'tag': 'v2.*',
      \ 'do': 'make install_jsregexp'
      \}                                         " Snippets
Plug 'liuchengxu/vim-which-key', {
      \ 'on': ['WhichKey', 'WhichKey!']
      \}                                         " Show mappings on timeout
Plug 'markonm/traces.vim'                        " Substitute preview
Plug 'milkypostman/vim-togglelist'               " Toggle fix lists
Plug 'neovim/nvim-lspconfig'                     " LSP configuration
Plug 'nvim-lua/plenary.nvim'                     " Lua utility library
Plug 'nvim-treesitter/nvim-treesitter'           " Treesitter config and abstraction
Plug 'thinca/vim-visualstar'                     " Search a visual mode selection
Plug 'tpope/vim-commentary'                      " Toggle comments
Plug 'tpope/vim-fugitive'                        " Git commands from inside Vim
Plug 'tpope/vim-surround'                        " Manipulate parens, tags, etc.
Plug 'vim-scripts/taglist.vim'                   " Code tag viewer
Plug 'wincent/ferret'                            " Project search enhancements
Plug 'wincent/loupe'                             " Search enhancements
Plug 'wincent/scalpel'                           " Quick replace word
Plug 'wincent/terminus'                          " Terminal integration

call plug#end()


"""""""""
" General
"""""""""
lua << EOF
-- Backspace
vim.opt.backspace='indent,eol,start'

-- Document Formatting
vim.o.autoindent = true
vim.o.conceallevel = 0
vim.o.wrap = false
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.opt.formatoptions = {
  -- See: :h fo-table
  c = true,
  j = true,
  l = true,
  o = true,
  q = true,
  r = true,
}

-- Filetypes
vim.cmd([[
  filetype on
  filetype plugin on
  filetype indent on
  syntax on
]])
vim.api.nvim_create_autocmd(
  {'FileType'},
  { pattern = 'make',
    command = 'setlocal noexpandtab' }
)
vim.api.nvim_create_autocmd(
  {'FileType'},
  { pattern = 'confluencewiki,markdown,text,votl',
    command = 'setlocal spell'
  }
)

-- File tree browser
vim.g.netrw_banner = 0                           -- Disable banner
vim.g.netrw_liststyle = 3                        -- Filetree browser style
vim.g.netrw_altv = 1                             -- Split vertically
vim.g.netrw_bufsettings = 'number'               -- Use line numbers

-- Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldenable = false                        -- Start unfolded. Re-enabled on fold

-- Search
if vim.fn.executable('rg') then
  vim.o.grepprg = 'rg --color=never'
end

-- Splits
vim.o.splitbelow = true

-- Terminal
vim.api.nvim_create_autocmd(
  {'TermOpen'},
  { pattern = '*',
    command = ':startinsert'
  }
)

-- Textwidth
vim.o.textwidth = 100

-- UI
vim.o.lazyredraw = true                          -- Macros don't redraw

-- Visual Bell
vim.o.visualbell = true

-- Working files
vim.o.updatetime = 300                           -- Write to swap every n ms
EOF


""""""""""""
" Appearance
""""""""""""
lua << EOF
-- ColorColumn
vim.o.colorcolumn = tostring(vim.o.textwidth + 1)

-- Cursor
vim.o.cursorline = true

-- Gutter
vim.o.number = true
vim.o.relativenumber = true

-- Ruler / Status line
vim.o.laststatus = 2
vim.g.lightline = {
  colorscheme = 'nord',
  inactive = {
    left = { {  }, { 'filename', 'modified' } }
  }
}

-- Theme
vim.cmd.colorscheme('murphy')
vim.o.background = 'dark'
EOF

""""""""""
" Commands
""""""""""
lua << EOF
vim.api.nvim_create_user_command('Splitterm', ':split | :terminal', {})
vim.api.nvim_create_user_command('Sterm', ':Splitterm', {})
vim.api.nvim_create_user_command('Vsplitterm', ':vsplit | :terminal', {})
vim.api.nvim_create_user_command('Vterm', ':Vsplitterm', {})
vim.api.nvim_create_user_command('We', ':write | :edit', {})
vim.api.nvim_create_user_command('Qa', ':qall', {})
EOF


""""""""""
" Mappings
""""""""""
lua << EOF
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Buffers
vim.keymap.set('n', '<Leader>bb', '<Cmd>Buffers<CR>', { silent = true })
vim.keymap.set('n', '<Leader>ba', '<Cmd>ball<CR>', { silent = true })

-- Comments
vim.keymap.set('x', '<Leader>;', '<Plug>Commentary')
vim.keymap.set('n', '<Leader>;', '<Plug>Commentary')
vim.keymap.set('o', '<Leader>;', '<Plug>Commentary')
vim.keymap.set('n', '<Leader>;;', '<Plug>CommentaryLine')

-- Copy
vim.keymap.set(
  'n',
  '<leader>cc',
  ':call mappings#copy_buffer_to_clipboard()<CR>',
  { silent = true }
)
vim.keymap.set(
  'x',
  '<leader>cc',
  ':call mappings#copy_selection_to_clipboard()<CR>',
  { silent = true }
)
vim.keymap.set(
  'n',
  '<leader>cp',
  ':call mappings#copy_current_file_relative_path_to_clipboard()<CR>',
  { silent = true }
)
vim.keymap.set(
  'n',
  '<leader>cP',
  ':call mappings#copy_current_file_absolute_path_to_clipboard()<CR>',
  { silent = true }
)

-- Diagnostics
vim.keymap.set('n', '<Leader>dl', vim.diagnostic.setloclist, { silent = true })
vim.keymap.set('n', '<Leader>dn', vim.diagnostic.goto_next, { silent = true })
vim.keymap.set('n', '<Leader>do', vim.diagnostic.open_float, { silent = true })
vim.keymap.set('n', '<Leader>dp', vim.diagnostic.goto_prev, { silent = true })
vim.keymap.set('n', '<Leader>dq', vim.diagnostic.setqflist, { silent = true })

-- Files
vim.keymap.set('n', '<Leader>ff', ':Files<CR>', { silent = true })
vim.keymap.set('n', '<Leader>fe', ':Explore<CR>', { silent = true })
vim.keymap.set('n', '<Leader>fg', ':GFiles<CR>', { silent = true })

-- Goto
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)

-- Hover
vim.keymap.set('n', 'K', vim.lsp.buf.hover)

-- Lists
vim.keymap.set('n', '<Leader>ll', ':call ToggleLocationList()<CR>')
vim.keymap.set('n', '<Leader>ln', ':lnext<CR>')
vim.keymap.set('n', '<Leader>lp', ':lprevious<CR>')
vim.keymap.set('n', '<Leader>qq', ':call ToggleQuickfixList()<CR>')
vim.keymap.set('n', '<Leader>qn', ':cnext<CR>')
vim.keymap.set('n', '<Leader>qp', ':cprevious<CR>')

-- Refactorings
vim.keymap.set('n', '<Leader>rr', '<Plug>(Scalpel)')
vim.keymap.set('n', '<Leader>rR', vim.lsp.buf.rename)
vim.keymap.set('n', '<Leader>ra', vim.lsp.buf.code_action)
vim.keymap.set('n', '<Leader>rl', vim.lsp.buf.format)
vim.keymap.set('n', '<Leader>ro', function() require('jdtls').organize_imports() end)

-- Search
vim.keymap.set('n', '<Leader>ss', '<Plug>(FerretAck)')
vim.keymap.set('n', '<Leader>sl', '<Plug>(FerretLack)')
vim.keymap.set('n', '<Leader>sr', '<Plug>(FerretAcks)')
vim.keymap.set('n', '<Leader>sw', '<Plug>(FerretAckWord)')

-- Snippets
vim.keymap.set(
  'i',
  '<Tab>',
  function()
    if require('luasnip').expand_or_jumpable() then
      return '<Plug>luasnip-expand-or-jump'
    else
      return '<Tab>'
    end
  end,
  { expr = true,
    silent = true }
)
vim.keymap.set(
  's',
  '<Tab>',
  function() require('luasnip').jump(1) end,
  { silent = true }
)
vim.keymap.set(
  { 'i', 's' },
  '<S-Tab>',
  function() require('luasnip').jump(-1) end,
  { silent = true }
)

-- Tags
vim.keymap.set('n', '<Leader>gt', '<Cmd>TlistToggle<CR>', { silent = true })

-- Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Toggles and Cycles
vim.keymap.set('n', '<Leader>tc', ':call mappings#cycle_columns()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>ti', ':call mappings#cycle_indentation()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>tp', ':call AutoPairsToggle<CR>', { silent = true })
vim.keymap.set('n', '<Leader>ts', ':call mappings#cycle_inccommand()<CR>', { silent = true })

-- Vim Configuration
vim.keymap.set('n', '<Leader>vv', ':tabnew $MYVIMRC')
vim.keymap.set('n', '<Leader>vr', ':source $MYVIMRC')

-- WhichKey
vim.keymap.set('n', '<Leader>', ':WhichKey \'<Leader>\'<CR>')
vim.keymap.set('n', '<Localleader>', ':WhichKey \'<Localleader>\'<CR>')

-- Windows
vim.keymap.set('n', '<Leader>wo', ':only<CR>')
vim.keymap.set('n', '<Leader>wq', '<C-W>q')
vim.keymap.set('n', '<Leader>ww', '<C-W>=')
vim.keymap.set('n', '<Leader>wh', '<C-W>h')
vim.keymap.set('n', '<Leader>wj', '<C-W>j')
vim.keymap.set('n', '<Leader>wk', '<C-W>k')
vim.keymap.set('n', '<Leader>wl', '<C-W>l')
vim.keymap.set('n', '<Leader>wH', '<C-W>H')
vim.keymap.set('n', '<Leader>wJ', '<C-W>J')
vim.keymap.set('n', '<Leader>wK', '<C-W>K')
vim.keymap.set('n', '<Leader>wL', '<C-W>L')
vim.keymap.set('n', '<Leader>wr', '<C-W>r')
vim.keymap.set('n', '<Leader>wR', '<C-W>R')
vim.keymap.set('n', '<Leader>wx', '<C-W>x')
vim.keymap.set('n', '<Leader>w<', '<C-W><')
vim.keymap.set('n', '<Leader>w>', '<C-W>>')
vim.keymap.set('n', '<Leader>w+', '<C-W>+')
vim.keymap.set('n', '<Leader>w-', '<C-W>-')
EOF


"""""""""""""""
" Plugin Config
"""""""""""""""
" cljfold.vim
let g:clojure_foldwords = "def,defn,defmacro,defmethod,defschema,defprotocol,defrecord,deftest,comment,testing"

" Conjure
let g:conjure_log_direction = "horizontal"

" fzf
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-s': 'split',
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit',
      \}

" LuaSnip
lua << EOF
require('luasnip.loaders.from_snipmate').lazy_load()
EOF

" nord.nvim
lua << EOF
vim.g.nord_borders = true
vim.g.nord_italic = true
require('nord').set()
EOF

" nvim-cmp
lua << EOF
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({ -- Order of sources dictactes order of results
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 5 },
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
      menu = {
        buffer = '[buf]',
        nvim_lsp = '[lsp]',
        nvim_lua = '[api]',
        path = '[path]',
        luasnip = '[snip]',
      }
    })
  }
})

-- Use buffer source for `/` and `?`.
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
EOF

" nvim-lspconfig
lua << EOF
require('lspconfig').angularls.setup {
  capabilities = capabilities
}
require('lspconfig').bashls.setup {
  capabilities = capabilities
}
require('lspconfig').clojure_lsp.setup {
  capabilities = capabilities
}
require('lspconfig').eslint.setup {
  capabilities = capabilities
}
require('lspconfig').jdtls.setup {
  capabilities = capabilities
}
require('lspconfig').lua_ls.setup {
  capabilities = capabilities,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}
require('lspconfig').marksman.setup {
  capabilities = capabilities
}
require('lspconfig').vimls.setup {
  capabilities = capabilities
}
EOF

" nvim-treesitter
lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'angular',
    'bash',
    'clojure',
    'css',
    'csv',
    'diff',
    'dockerfile',
    'fennel',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'go',
    'gomod',
    'helm',
    'html',
    'http',
    'java',
    'javascript',
    'json',
    'lua',
    'luadoc',
    'make',
    'markdown',
    'markdown_inline',
    'properties',
    'python',
    'ruby',
    'scss',
    'sql',
    'terraform',
    'tmux',
    'typescript',
    'vim',
    'vimdoc',
    'xml',
    'yaml'
  },
  highlight = {
    enable = true,
  }
}
EOF

" Signify
let g:signify_update_on_focusgained = 1

" Taglist
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Sort_Type = "name"
let Tlist_Use_SingleClick = 1

" Toggle List
let g:toggle_list_no_mappings = 1

" TypeScript Tools
lua << EOF
require('typescript-tools').setup {
  settings = {
    separate_diagnostic_server = true,
    publish_diagnostic_on = 'insert_leave'
  }
}
EOF

" WhichKey
let g:which_key_map = {}
let g:which_key_map.b = { 'name': '+buffers' }
let g:which_key_map.c = { 'name': '+copy' }
let g:which_key_map.f = { 'name': '+files' }
let g:which_key_map.g = { 'name': '+goto' }
let g:which_key_map.l = { 'name': '+locationlist' }
let g:which_key_map.r = { 'name': '+refactor' }
let g:which_key_map.s = { 'name': '+search' }
let g:which_key_map.t = { 'name': '+toggle' }
let g:which_key_map.v = { 'name': '+vim' }
let g:which_key_map.w = { 'name': '+window' }
let g:which_key_map.q = { 'name': '+quickfixlist' }
autocmd! User vim-which-key call which_key#register("<Space>", "g:which_key_map")
