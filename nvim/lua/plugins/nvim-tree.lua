return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local api = require 'nvim-tree.api'

    vim.keymap.set('n', '<C-n>', api.tree.toggle, { desc = 'NvimTree' })

    require('nvim-tree').setup {
      update_focused_file = {
        enable = true,
      },

      actions = {
        open_file = {
          quit_on_open = true,
        },
      },

      git = {
        ignore = false,
      },
    }
  end,
}
