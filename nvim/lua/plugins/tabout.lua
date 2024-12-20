return {
  'abecodes/tabout.nvim',
  lazy = false,
  config = function()
    require('tabout').setup {}

    vim.api.nvim_set_keymap('i', '<tab>', "<Plug>(TaboutMulti)", { silent = true })
    vim.api.nvim_set_keymap('i', '<S-tab>', "<Plug>(TaboutBackMulti)", { silent = true })
  end
}
