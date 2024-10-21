return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    local treesj = require 'treesj'

    ---@format disable
    local mappings = {
      { '<leader>jj', treesj.toggle, 'Toggle split/join' },
      { '<leader>jJ', treesj.join, 'Join' },
      { '<leader>jS', treesj.split, 'Split' },
    }
    ---@format enable

    for _, mapping in pairs(mappings) do
      local lhs, rhs, desc = unpack(mapping)

      vim.keymap.set({ 'n', 'x' }, lhs, rhs, { desc = desc })
    end
  end,
}
