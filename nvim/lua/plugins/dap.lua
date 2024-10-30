return {
  'mfussenegger/nvim-dap',

  enabled = false, -- Finish setup later.

  config = function()
    local dap = require 'dap'

    local mappings = {
      { '<M-d>b', dap.toggle_breakpoint, 'Toggle breakpoint' },
      { '<M-d>c', dap.continue, 'Continue' },
      { '<M-d>si', dap.step_into, 'Step into' },
      { '<M-d>sb', dap.step_over, 'Step over' },
    }

    for _, mapping in pairs(mappings) do
      local lhs, rhs, desc = unpack(mapping)

      vim.keymap.set({ 'n', 'x' }, lhs, rhs, { desc = desc })
    end
  end,
}
