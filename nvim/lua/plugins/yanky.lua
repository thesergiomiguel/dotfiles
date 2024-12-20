return {
  'gbprod/yanky.nvim',
  lazy = false,

  opts = {
    highlight = {
      on_put = true,
      on_yank = true,
      timer = 200,
    },
  },

  ---@format disable
  keys = {
    { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put after cursor' },
    { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put before cursor' },
    { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Put after cursor' },
    { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Put before cursor' },
    { '<M-J>', '<Plug>(YankyPreviousEntry)', desc = 'Previous yank' },
    { '<M-K>', '<Plug>(YankyNextEntry)', desc = 'Next yank' },
    { '<M-x><M-y>', '<cmd>YankyRingHistory<cr>', desc = 'Historical yanks' },
  },
  ---@format enable
}
