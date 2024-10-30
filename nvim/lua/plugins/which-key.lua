return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    replace = {
      -- key = {
      --   function(key)
      --     print(key)
      --     return require('which-key.view').format(key)
      --   end,
      --   { '<Space>', 'SPC' },
      --   { '<cr>', 'ENTER' },
      --   { '<leader>', 'LEADER' },
      --   { '<localleader>', 'LOCALLEADER' },
      --   { '<Esc>', 'ESC' },
      -- },
    },

    win = {
      border = 'single',
    },
  },
}
