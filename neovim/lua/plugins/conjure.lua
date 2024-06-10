vim.g.conjure_log_direction = 'horizontal'
vim.g['conjure#extract#tree_sitter#enabled'] = true

vim.api.nvim_create_autocmd("BufNewFile", {
  group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
  pattern = { "conjure-log-*" },
  callback = function() vim.diagnostic.enable(false) end,
  desc = "Conjure Log disable LSP diagnostics",
})
