return {
  'NeogitOrg/neogit',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },

  event = 'VeryLazy',

  keys = {
    { '<M-x><M-g>', '<cmd>Neogit<cr>', { desc = 'Neogit' } },
  },

  opts = {
    disable_hint = true,
    disable_builtin_notifications = true,
    disable_commit_confirmation = true,

    integrations = {
      telescope = true,
      diffview = true,
    },

    commit_editor = {
      kind = 'split',
    },
  },
}
