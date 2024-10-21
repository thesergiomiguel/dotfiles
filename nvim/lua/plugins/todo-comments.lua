return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local tc = require 'todo-comments'
    tc.setup {}

    ---@format disable
    local mappings = {
      { '[t', tc.jump_prev, 'Previous Todo' },
      { ']t', tc.jump_next, 'Next Todo' },
      { '<leader>ct', '<cmd>TodoTelescope<cr>', 'Open todos on telescope' },
      { '<leader>cq', '<cmd>TodoQuickFix<cr>', 'Open todos on quickfix' },
    }
    ---@format enable

    for _, mapping in pairs(mappings) do
      local lhs, rhs, desc = unpack(mapping)

      vim.keymap.set('n', lhs, rhs, { desc = desc })
    end
  end,
}
