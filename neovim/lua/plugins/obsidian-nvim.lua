require('obsidian').setup({
  workspaces = {
    {
      name = 'Notes',
      path = '~/Notes',
    },
    {
      name = 'no-vault',
      path = function() return assert(vim.fn.getcwd()) end,
      overrides = {
        daily_notes = { folder = vim.NIL },
        nodes_subdir = vim.NIL,
        new_notes_location = 'current_dir',
        templates = { folder = vim.NIL, },
      },
    },
  },

  daily_notes = {
    default_tags = { 'daily' },
    folder = 'dailies',
    template = 'daily.md',
    workdays_only = false,
  },

  disable_frontmatter = true,
  legacy_commands = false,
  picker = { name = 'fzf-lua', },
  preferred_link_style = 'markdown',
  templates = { folder = 'templates', },
  ui = { enable = false, },

  callbacks = {
    post_setup = function(_)
      require('which-key').add({
        { '<LocalLeader>d',  group = '(D)ailies' },
        { '<LocalLeader>dd', '<Cmd>Obsidian today<CR>',             desc = 'Today' },
        { '<LocalLeader>dt', '<Cmd>Obsidian tomorrow<CR>',          desc = '(T)omorrow' },
        { '<LocalLeader>dy', '<Cmd>Obsidian yesterday<CR>',         desc = '(Y)esterday' },
        { '<LocalLeader>l',  group = '(L)inks',                     mode = 'n' },
        { '<LocalLeader>ll', '<Cmd>Obsidian links<CR>',             desc = '(L)inks',                mode = 'n' },
        { '<LocalLeader>lb', '<Cmd>Obsidian backlinks<CR>',         desc = '(B)acklinks',            mode = 'n' },
        { '<LocalLeader>l',  group = '(L)ink',                      mode = 'x' },
        { '<LocalLeader>ll', '<Cmd>Obsidian link<CR>',              desc = '(L)ink...',              mode = 'x' },
        { '<LocalLeader>ln', '<Cmd>Obsidian link_new<CR>',          desc = 'Link (N)ew...',          mode = 'x' },
        { '<LocalLeader>n',  group = '(N)ew' },
        { '<LocalLeader>nn', '<Cmd>Obsidian new<CR>',               desc = '(N)ote...' },
        { '<LocalLeader>nt', '<Cmd>Obsidian new_from_template<CR>', desc = 'Note from (T)emplate...' },
        { '<LocalLeader>r',  '<Cmd>Obsidian rename<CR>',            desc = '(R)ename Note' },
        { '<LocalLeader>s',  group = '(S)earch' },
        { '<LocalLeader>ss', '<Cmd>Obsidian search<CR>',            desc = '(S)earch...' },
        { '<LocalLeader>st', '<Cmd>Obsidian tags<CR>',              desc = 'Search (T)ags...' },
        { '<LocalLeader>t',  '<Cmd>Obsidian template<CR>',          desc = '(T)emplate...' },
        { '<LocalLeader>w',  '<Cmd>Obsidian workspace<CR>',         desc = '(W)orkspace...' },
      })
    end
  }
})
