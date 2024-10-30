require('lazy').setup {
  'folke/lazy.nvim',

  { import = 'plugins' },
  { import = 'colors' },
}

vim.keymap.set('n', '<M-x><M-l>', '<cmd>Lazy check<cr>', { desc = 'Lazy' })
