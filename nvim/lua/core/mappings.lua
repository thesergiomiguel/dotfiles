---@param direction 'forward' | 'backwards'
local function cycle_qf_items(direction)
  local fn = direction == 'forward' and vim.cmd.cnext or vim.cmd.cprevious
  local turn_fn = direction == 'forward' and vim.cmd.cfirst or vim.cmd.clast

  return function()
    local len = #vim.fn.getqflist()

    if len == 0 then
      print 'Quickfix is empty'
      return
    end

    local ok, _ = pcall(fn)

    if ok then
      return
    end

    turn_fn()
  end
end

local mappings = {
  ---@format disable
  [{ 'n', 'x' }] = {
    { '<C-q>', '<cmd>confirm qa<cr>', 'Quit all?' },
    { '<C-s>', '<cmd>write<cr>', 'Write' },
    { '<M-esc>', '<cmd>nohlsearch<cr>', 'Clear search hl' },
    { '<M-o>', 'o<esc>', 'Line below' },
    { '<M-O>', 'O<esc>', 'Line above' },

    -- buffers, windows
    { '<leader>bd', '<cmd>bdelete<cr>', 'Delete buffer' },
    { '<leader>bD', '<cmd>bdelete!<cr>', 'Delete buffer!' },
    { '<leader>t', '<cmd>tab split<cr>', 'New tab, keep cursor' },
    { '<leader>v', '<cmd>vsplit<cr>', 'V-split' },
    { '<leader>s', '<cmd>split<cr>', 'Split' },
    { '<M-]>', 'gt', 'Next tab' },
    { '<M-[>', 'gT', 'Previous tab' },

    -- Why for the love of god is vim still printing errors when we hit the end of the list??
    { ']q', cycle_qf_items 'forward', 'Cycle qf items to the right' },
    { '[q', cycle_qf_items 'backwards', 'Cycle qf items to the left' },
  },

  ['i'] = {
    { '<M-esc>', '<esc><cmd>nohlsearch<cr>a', ':nohlsearch' },
    { '<M-p>', '"', 'put' },
  },
  ---@format enable
}

for mode, mode_mappings in pairs(mappings) do
  for _, mapping in pairs(mode_mappings) do
    local lhs, rhs, desc = unpack(mapping)

    vim.keymap.set(mode, lhs, rhs, { desc = desc })
  end
end
