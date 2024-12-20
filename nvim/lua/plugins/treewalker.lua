return {
  'aaronik/treewalker.nvim',
  lazy = false,
  keys = {
    { '<M-j>', ':Treewalker Down<CR>' },
    { '<M-k>', ':Treewalker Up<CR>' },
    { '<M-h>', ':Treewalker Left<CR>' },
    { '<M-l>', ':Treewalker Right<CR>' },
  },
  opts = {
    highlight = true,
  },
}
