-- Ensure the plugin manager is available
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Setup plugins
require('lazy').setup({

  -------------------
  -- Language Support
  -------------------
  {
    'bakpakin/fennel.vim',
    ft = 'fennel',
  }, -- Fennel
  {
    'elubow/cql-vim',
    ft = 'cql',
  }, -- Cassandra Query Language
  {
    'gberenfield/cljfold.vim',
    ft = 'clojure',
    config = function()
      local foldwords = {
        'def',
        'defn',
        'defmacro',
        'defmethod',
        'defschema',
        'defprotocol',
        'defrecord',
        'deftest',
        'comment',
        'testing'
      }
      vim.g.clojure_foldwords = table.concat(foldwords, ',')
    end,
  }, -- Configurable Clojure Folding
  {
    'mfussenegger/nvim-jdtls',
    ft = 'java',
  }, -- Java JDTLS Extensions
  {
    'lucidmachine/vim-velocity',
    ft = 'vtl',
  }, -- Velocity
  {
    'mikeboiko/vim-markdown-folding',
    ft = 'markdown'
  }, -- Fold Markdown headers
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel' },
    config = function()
      vim.g.conjure_log_direction = 'horizontal'
    end
  }, -- Interactive Eval
  {
    'pmizio/typescript-tools.nvim',
    ft = { 'typescript', 'javascript' },
    config = function()
      require('typescript-tools').setup {
        settings = {
          separate_diagnostic_server = true,
          publish_diagnostic_on = 'insert_leave'
        }
      }
    end,
  }, -- TS/JS LSP extensions
  {
    'vimoutliner/vimoutliner',
    ft = 'votl',
  }, -- Outline mode for .otl
  {
    'vim-scripts/confluencewiki.vim',
    ft = 'confluencewiki',
  }, -- Confluence wiki syntax


  -------------
  -- Appearance
  -------------
  {
    'itchyny/lightline.vim',
    config = function()
      vim.g.lightline = {
        colorscheme = 'nord',
        inactive = {
          left = { {}, { 'filename', 'modified' } }
        }
      }
    end,
  }, -- Lightweight status line
  {
    'mhinz/vim-signify',
    config = function()
      vim.g.signify_update_on_focusgained = 1
    end,
  }, -- VCS diff gutter
  {
    'shaunsingh/nord.nvim',
    config = function()
      vim.g.nord_borders = true
      vim.g.nord_italic = false
      require('nord').set()
    end
  },                         -- Nord theme with Treesitter support
  { 'Yggdroot/indentLine' }, -- Indentation level lines

  -------------
  -- Completion
  -------------
  { 'hrsh7th/cmp-nvim-lsp' }, -- nvim-cmp LSP source
  { 'hrsh7th/cmp-buffer' },   -- nvim-cmp buffer source
  { 'hrsh7th/cmp-path' },     -- nvim-cmp filesystem source
  { 'hrsh7th/cmp-cmdline' },  -- nvim-cmp source for Vim commands
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function() require('plugins.nvim-cmp') end
  },                              -- nvim-cmp core
  { 'hrsh7th/cmp-nvim-lua' },     -- nvim-cmp source for nvim Lua APIs
  { 'onsails/lspkind.nvim' },     -- nvim-cmp source formatting
  { 'saadparwaiz1/cmp_luasnip' }, -- nvim-cmp LuaSnip source

  -- Other
  { 'editorconfig/editorconfig-vim' }, -- Cross-editor config files
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function() require('plugins.which-key-nvim') end
  },                          -- Show mappings on timeout
  { 'jiangmiao/auto-pairs' }, -- Balance paired characters
  { 'junegunn/fzf' },         -- Fuzzy finder
  {
    'junegunn/fzf.vim',
    config = function()
      local fzf_action = {}
      fzf_action['ctrl-s'] = 'split'
      fzf_action['ctrl-t'] = 'tab split'
      fzf_action['ctrl-v'] = 'vsplit'
      vim.g.fzf_action = fzf_action
    end
  }, -- Vim integration for fzf
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    config = function()
      require('luasnip.loaders.from_snipmate').lazy_load()
    end
  },                        -- Snippets
  { 'markonm/traces.vim' }, -- Substitute preview
  {
    'milkypostman/vim-togglelist',
    config = function()
      vim.g.toggle_list_no_mappings = 1
    end
  }, -- Toggle fix lists
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function() require('plugins.nvim-lspconfig') end
  },                           -- LSP configuration
  { 'nvim-lua/plenary.nvim' }, -- Lua utility library
  {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.nvim-treesitter') end
  },                           -- Treesitter config and abstraction
  { 'thinca/vim-visualstar' }, -- Search a visual mode selection
  { 'tpope/vim-commentary' },  -- Toggle comments
  { 'tpope/vim-fugitive' },    -- Git commands from inside Vim
  { 'tpope/vim-surround' },    -- Manipulate parens, tags, etc.
  {
    'vim-scripts/taglist.vim',
    config = function()
      vim.g.Tlist_Auto_Highlight_Tag = 1
      vim.g.Tlist_Auto_Update = 1
      vim.g.Tlist_Inc_Winwidth = 0
      vim.g.Tlist_Sort_Type = 'name'
      vim.g.Tlist_Use_Right_Window = 1
      vim.g.Tlist_Use_SingleClick = 1
    end
  },                      -- Code tag viewer
  { 'wincent/ferret' },   -- Project search enhancements
  { 'wincent/loupe' },    -- Search enhancements
  { 'wincent/scalpel' },  -- Quick replace word
  { 'wincent/terminus' }, -- Terminal integration
})
