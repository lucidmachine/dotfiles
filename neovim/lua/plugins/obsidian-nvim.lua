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

  callbacks = {
    enter_note = function(_, note)
      vim.keymap.set(
        'n',
        '<Localleader>cx',
        function()
          return require('obsidian').util.toggle_checkbox()
        end,
        { buffer = note.bufnr }
      )
      vim.keymap.set(
        'n',
        'gf',
        function ()
          return require('obsidian').util.gf_passthrough()
        end,
        { noremap = false, expr = true, buffer = note.bufnr }
      )
    end,
  },

  daily_notes = {
    default_tags = {},
    folder = 'dailies',
    template = 'daily.md',
    workdays_only = false,
  },

  disable_frontmatter = true,
  legacy_commands = false,

  templates = {
    folder = 'templates',
  },

  ui = {
    enable = false,
  },
})

