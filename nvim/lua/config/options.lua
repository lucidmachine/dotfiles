-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ColorColumn
vim.o.colorcolumn = "+1"

-- Document Formatting
vim.o.conceallevel = 0

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

-- UI
vim.o.lazyredraw = true -- Macros don't redraw

-- Visual Bell
vim.o.visualbell = true
