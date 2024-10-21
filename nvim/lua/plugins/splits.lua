return {
  'mrjones2014/smart-splits.nvim',

  event = 'VeryLazy',
  config = function()
    local splits = require 'smart-splits'

    ---@format disable
    local mappings = {
      { '<C-h>', splits.move_cursor_left, 'Move to left window' },
      { '<C-j>', splits.move_cursor_down, 'Move to window below' },
      { '<C-k>', splits.move_cursor_up, 'Move to window above' },
      { '<C-l>', splits.move_cursor_right, 'Move to right window' },
      { '<CM-H>', splits.resize_left, 'Resize left' },
      { '<CM-J>', splits.resize_down, 'Resize down' },
      { '<CM-K>', splits.resize_up, 'Resize up' },
      { '<CM-L>', splits.resize_right, 'Resize right' },
    }
    ---@format enable

    for _, mapping in pairs(mappings) do
      local lhs, rhs, desc = unpack(mapping)

      vim.keymap.set('n', lhs, rhs, { desc = desc })
    end
  end,
}
