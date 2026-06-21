-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ColorColumn
vim.o.colorcolumn = "+1"

-- Document Formatting
vim.o.autoindent = true
vim.o.conceallevel = 0
vim.o.smarttab = true

-- Filetypes
vim.cmd([[
  filetype on
  filetype plugin on
  filetype indent on
  syntax on
]])
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "confluencewiki,markdown,text",
    command = "setlocal spell",
})

-- Folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldenable = false -- Start unfolded. Re-enabled on fold

-- Terminal
vim.api.nvim_create_autocmd({ "TermOpen" }, {
    pattern = "*",
    command = ":startinsert",
})

-- Textwidth
vim.o.textwidth = 100

-- Visual Bell
vim.o.visualbell = true
