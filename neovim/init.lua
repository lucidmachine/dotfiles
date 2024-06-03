----------
-- General
----------
-- Backspace
vim.opt.backspace = 'indent,eol,start'

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
  { 'FileType' },
  {
    pattern = 'make',
    command = 'setlocal noexpandtab'
  }
)
vim.api.nvim_create_autocmd(
  { 'FileType' },
  {
    pattern = 'confluencewiki,markdown,text,votl',
    command = 'setlocal spell'
  }
)

-- File tree browser
vim.g.netrw_banner = 0             -- Disable banner
vim.g.netrw_liststyle = 3          -- Filetree browser style
vim.g.netrw_altv = 1               -- Split vertically
vim.g.netrw_bufsettings = 'number' -- Use line numbers

-- Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldenable = false -- Start unfolded. Re-enabled on fold

-- Search
if vim.fn.executable('rg') then
  vim.o.grepprg = 'rg --color=never'
end

-- Splits
vim.o.splitbelow = true

-- Terminal
vim.api.nvim_create_autocmd(
  { 'TermOpen' },
  {
    pattern = '*',
    command = ':startinsert'
  }
)

-- Textwidth
vim.o.textwidth = 100

-- UI
vim.o.lazyredraw = true -- Macros don't redraw

-- Visual Bell
vim.o.visualbell = true

-- Working files
vim.o.updatetime = 300 -- Write to swap every n ms


-------------
-- Appearance
-------------
-- ColorColumn
vim.o.colorcolumn = tostring(vim.o.textwidth + 1)

-- Cursor
vim.o.cursorline = true

-- Gutter
vim.o.number = true
vim.o.relativenumber = true

-- Ruler / Status line
vim.o.laststatus = 2

-- Theme
vim.cmd.colorscheme('murphy')
vim.o.background = 'dark'

-----------
-- Commands
-----------
vim.api.nvim_create_user_command('Splitterm', ':split | :terminal', {})
vim.api.nvim_create_user_command('Sterm', ':Splitterm', {})
vim.api.nvim_create_user_command('Vsplitterm', ':vsplit | :terminal', {})
vim.api.nvim_create_user_command('Vterm', ':Vsplitterm', {})
vim.api.nvim_create_user_command('We', ':write | :edit', {})
vim.api.nvim_create_user_command('Qa', ':qall', {})


-----------
-- Mappings
-----------
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
  '<Leader>cc',
  ':call mappings#copy_buffer_to_clipboard()<CR>',
  { silent = true }
)
vim.keymap.set(
  'x',
  '<Leader>cc',
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
  {
    expr = true,
    silent = true
  }
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


require('plugins')
