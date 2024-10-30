return {
  'smilhey/ed-cmd.nvim',
  config = function()
    require('ed-cmd').setup {
      cmdline = {
        keymaps = {
          edit = '<esc>',
          execute = '<cr>',
          close = { '<C-c>', 'q' },
        },
      },
      pumenu = { max_items = 100 },
    }
  end,
}
