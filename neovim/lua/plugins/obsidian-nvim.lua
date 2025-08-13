require('obsidian').setup({
  workspaces = {
    {
      name = 'Notes',
      path = '~/Notes',
    },
    {
      name = 'no-vault',
      path = function () return assert(vim.fn.getcwd()) end,
      overrides = {
        nodes_subdir = vim.NIL,
        new_notes_location = 'current_dir',
        templates = {
          folder = vim.NIL,
        },
      },
    },
  },

  daily_notes = {
    default_tags = {},
    folder = 'dailies',
    template = 'daily.md',
    workdays_only = false,
  },

  disable_frontmatter = true,
  legacy_commands = false,

  picker = {
    name = 'fzf-lua',
  },

  templates = {
    folder = 'templates',
  },

  ui = {
    enable = false,
  },
})

