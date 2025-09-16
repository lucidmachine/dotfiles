local actions = require('actions')

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Buffers
vim.keymap.set('n', '<Leader>bb', '<Cmd>FzfLua buffers<CR>', { silent = true })
vim.keymap.set('n', '<Leader>ba', '<Cmd>ball<CR>', { silent = true })

-- Comments
vim.keymap.set('x', '<Leader>;', '<Plug>Commentary')
vim.keymap.set('n', '<Leader>;', '<Plug>Commentary')
vim.keymap.set('o', '<Leader>;', '<Plug>Commentary')
vim.keymap.set('n', '<Leader>;;', '<Plug>CommentaryLine')

-- Copy
vim.keymap.set('n', '<Leader>cc', actions.copyBufferToClipboard, { silent = true })
vim.keymap.set('x', '<Leader>cc', actions.copyVisualSelectionToClipboard, { silent = true })
vim.keymap.set('n', '<Leader>cp', actions.copyCurrentFileRelativePathToClipboard, { silent = true })
vim.keymap.set('n', '<Leader>cP', actions.copyCurrentFileAbsolutePathToClipboard, { silent = true })

-- Diagnostics
vim.keymap.set('n', '<Leader>dl', vim.diagnostic.setloclist, { silent = true })
vim.keymap.set('n', '<Leader>dn', actions.nextDiagnostic, { silent = true })
vim.keymap.set('n', '<Leader>do', vim.diagnostic.open_float, { silent = true })
vim.keymap.set('n', '<Leader>dp', actions.prevDiagnostic, { silent = true })
vim.keymap.set('n', '<Leader>dq', vim.diagnostic.setqflist, { silent = true })

-- Files
vim.keymap.set('n', '<Leader>ff', '<Cmd>FzfLua files<CR>', { silent = true })
vim.keymap.set('n', '<Leader>fe', ':Explore<CR>', { silent = true })

-- Goto
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)

-- Hover
vim.keymap.set('n', 'K', vim.lsp.buf.hover)

-- Lists
vim.keymap.set('n', '<Leader>ll', ':call ToggleLocationList()<CR>')
vim.keymap.set('n', '<Leader>lf', '<Cmd>FzfLua loclist<CR>')
vim.keymap.set('n', '<Leader>ln', ':lnext<CR>')
vim.keymap.set('n', '<Leader>lp', ':lprevious<CR>')
vim.keymap.set('n', '<Leader>qq', ':call ToggleQuickfixList()<CR>')
vim.keymap.set('n', '<Leader>qf', '<Cmd>FzfLua quickfix<CR>')
vim.keymap.set('n', '<Leader>qn', ':cnext<CR>')
vim.keymap.set('n', '<Leader>qp', ':cprevious<CR>')

-- Refactorings
vim.keymap.set('n', '<Leader>rr', actions.rename)
vim.keymap.set('n', '<Leader>rR', '<Plug>(Scalpel)')
vim.keymap.set('n', '<Leader>ra', vim.lsp.buf.code_action)
vim.keymap.set('n', '<Leader>rl', vim.lsp.buf.format)
vim.keymap.set('n', '<Leader>ro', actions.organizeImports)

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
vim.keymap.set('n', '<Leader>gt', '<Cmd>AerialToggle<CR>', { silent = true })

-- Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Toggles and Cycles
vim.keymap.set('n', '<Leader>tc', actions.cycleColumns, { silent = true })
vim.keymap.set('n', '<Leader>ti', actions.cycleIndentationMode, { silent = true })
vim.keymap.set('n', '<Leader>tp', ':call AutoPairsToggle()<CR>', { silent = true })

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
