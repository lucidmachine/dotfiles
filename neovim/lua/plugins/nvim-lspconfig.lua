local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lombok = vim.fn.stdpath('data') .. '/mason/packages/jdtls/lombok.jar'

vim.lsp.config('angularls', {
  capabilities = capabilities
})
vim.lsp.config('bashls', {
  capabilities = capabilities
})
vim.lsp.config('clojure_lsp', {
  capabilities = capabilities
})
vim.lsp.config('eslint', {
  capabilities = capabilities
<<<<<<< HEAD
}
require('lspconfig').jdtls.setup {
  capabilities = capabilities,
  cmd = { 'jdtls', '--jvm-arg=-javaagent:' .. lombok },
  root_markers = { { 'pom.xml', 'gradle.settings', 'pom.xml' }, '.git' }
}
require('lspconfig').lua_ls.setup {
=======
})
vim.lsp.config('jdtls', {
  capabilities = capabilities
})
vim.lsp.config('lua_ls', {
>>>>>>> dbdbdbc (nvim: Update LSP configuration calls)
  capabilities = capabilities,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
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
})
vim.lsp.config('marksman', {
  capabilities = capabilities
})
vim.lsp.config('vimls', {
  capabilities = capabilities
})
