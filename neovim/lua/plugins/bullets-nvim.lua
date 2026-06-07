require('Bullets').setup({
  mappings = false,
  outline_levels = {'ROM','ABC', 'num', 'abc', 'rom', 'std*', 'std-'},
})

vim.api.nvim_create_augroup('BulletMaps', { clear = true })
vim.api.nvim_create_autocmd(
  { 'Filetype' },
  {
    pattern = { 'markdown', 'text', 'gitcommit', },
    group = 'BulletMaps',
    callback = function(tbl)
      local buf = tbl.buf

      vim.keymap.set('n', '<LocalLeader>bx', '<Plug>(bullets-toggle-checkbox)', { buffer = buf })
      vim.keymap.set('n', '<LocalLeader>bn', '<Plug>(bullets-renumber)', { buffer = buf })
      vim.keymap.set('n', '<<', '<Plug>(bullets-promote)', { buffer = buf })
      vim.keymap.set('n', '>>', '<Plug>(bullets-demote)', { buffer = buf })
      vim.keymap.set('n', 'o', '<Plug>(bullets-newline-o)', { buffer = buf })

      vim.keymap.set('i', '<CR>', '<Plug>(bullets-newline-cr)', { buffer = buf })
      vim.keymap.set('i', '<Tab>', '<Plug>(bullets-demote)', { buffer = buf })
      vim.keymap.set('i', '<S-Tab>', '<Plug>(bullets-promote)', { buffer = buf })

      vim.keymap.set('v', '<', '<Plug>(bullets-promote)', { buffer = buf })
      vim.keymap.set('v', '>', '<Plug>(bullets-demote)', { buffer = buf })
      vim.keymap.set('v', '<LocalLeader>bn', '<Plug>(bullets-renumber)', { buffer = buf })

      require('which-key').add({
        { '<LocalLeader>b', group = '(B)ullets' },
        { '<LocalLeader>bx', desc = 'Toggle Checkbo(x)' },
        { '<LocalLeader>bn', desc = 'Re(n)umber List' },
      })
    end,
  }
)
