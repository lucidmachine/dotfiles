-- Ensure the plugin manager is available
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Setup plugins
require('lazy').setup({

  -------------------
  -- Language Support
  -------------------
  { 'bakpakin/fennel.vim', ft = 'fennel', },
  { 'elubow/cql-vim',      ft = 'cql', },
  {
    'gberenfield/cljfold.vim',
    ft = 'clojure',
    init = function() require('plugins.cljfold-vim') end,
  },
  { 'mfussenegger/nvim-jdtls',        ft = 'java', },
  { 'lucidmachine/vim-velocity',      ft = 'vtl', },
  { 'mikeboiko/vim-markdown-folding', ft = 'markdown' },
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'lua', 'python' },
    config = function() require('plugins.conjure') end
  },
  {
    'pmizio/typescript-tools.nvim',
    ft = { 'typescript', 'javascript' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.typescript-tools-nvim') end,
  },
  { 'vimoutliner/vimoutliner',        ft = 'votl', },
  { 'vim-scripts/confluencewiki.vim', ft = 'confluencewiki', },


  -------------
  -- Appearance
  -------------
  {
    'itchyny/lightline.vim',
    init = function() require('plugins.lightline-vim') end,
  },
  {
    'mhinz/vim-signify',
    init = function() vim.g.signify_update_on_focusgained = 1 end,
  },
  {
    'shaunsingh/nord.nvim',
    config = function() require('plugins.nord-nvim') end
  },


  -------------
  -- Completion
  -------------
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip',
    },
    event = 'VeryLazy',
    config = function() require('plugins.nvim-cmp') end
  },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'onsails/lspkind.nvim' },
  { 'saadparwaiz1/cmp_luasnip' },


  --------
  -- Other
  --------
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function() require('plugins.which-key-nvim') end
  },
  { 'jiangmiao/auto-pairs' },
  { 'junegunn/fzf' },
  {
    'junegunn/fzf.vim',
    build = function() vim.fn['fzf#install']() end,
    init = function() require('plugins.fzf-vim') end
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    event = 'BufEnter',
    config = function() require('luasnip.loaders.from_snipmate').lazy_load() end
  },
  { 'markonm/traces.vim' },
  {
    'milkypostman/vim-togglelist',
    init = function() vim.g.toggle_list_no_mappings = 1 end },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function() require('plugins.nvim-lspconfig') end
  },
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.nvim-treesitter') end
  },
  {
    'stevearc/aerial.nvim',
    keys = '<Leader>gt',
    init = function() require('plugins.aerial-nvim') end,
  },
  { 'thinca/vim-visualstar' },
  { 'tpope/vim-commentary' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-surround' },
  { 'wincent/ferret' },
  { 'wincent/loupe' },
  { 'wincent/scalpel' },
  { 'wincent/terminus' },
})
