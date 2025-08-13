require('Bullets').setup()

vim.api.nvim_create_autocmd(
  'Filetype',
  {
    pattern = 'markdown,text,gitcommit',
    group = 'BulletMaps',
    callback = function(_, bufnr)
      vim.keymap.set('i', '<Tab>', '<Plug>(bullets-demote)', { buffer = bufnr })
      vim.keymap.set('i', '<S-Tab>', '<Plug>(bullets-promote)', { buffer = bufnr })
      vim.keymap.set('n', '<LocalLeader>cx', '<Plug>(bullets-toggle-checkbox)', { buffer = bufnr })
    end,
  }
)
