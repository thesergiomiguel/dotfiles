--
return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  config = function()
    local flash = require 'flash'

    flash.setup {
      jump = {
        autojump = false,
      },

      modes = {
        char = {
          enabled = false,
        },

        search = {
          enabled = false,
        },
      },
    }

    -- Regular flash use, go-to character (with labels)
    vim.keymap.set({ 'n', 'x', 'o' }, '<leader>f', flash.jump, { desc = 'Flash jump' })

    -- Performs an action at a distance
    vim.keymap.set('o', 'r', flash.remote, { desc = 'Remote flash' })

    -- Performs an action at a distance on an entire (ts) node;
    -- the `n` on the lhs stands for node
    vim.keymap.set({ 'x', 'o' }, 'n', flash.treesitter_search, { desc = 'Treesitter search' })

    -- Used with / or ?, to toggle label-based searching
    vim.keymap.set('c', '<C-s>', flash.toggle, { desc = 'Toggle flash' })
  end,
}
