-- Diff unsaved changes
vim.api.nvim_create_user_command('DiffOrig', function()
  vim.cmd 'vertical new'
  vim.bo.buftype = 'nofile'

  vim.cmd 'read ++edit #'
  vim.cmd 'normal ggdd'

  vim.keymap.set('n', 'q', '<cmd>bdelete<cr>', { buffer = 0 })

  vim.cmd.diffthis()
  vim.cmd.wincmd 'p'
  vim.cmd.diffthis()
  vim.cmd.wincmd 'p'
end, {})
